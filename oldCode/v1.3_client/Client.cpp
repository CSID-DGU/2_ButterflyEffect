#include "opencv2/opencv.hpp"
#include "config.h"
#include "PracticalSocket.h"      // For UDPSocket and SocketException
#include <iostream>               // For cout and cerr
#include <cstdlib>                // For atoi()
#include <cstring>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <ctime>
#include <unistd.h>
#include <pthread.h>
#include <sstream>
#include <vector>

using namespace std;
using namespace cv;

#define PORT_NUM "9000"
#define ADDR "127.0.0.1"
#define BUFFER_SIZE 2000
/*Rect  ... 전역변*/

Rect rect;

pthread_mutex_t count_mutex;
int sock;
int point[4];


struct Pt{
    float x, y;
};

struct UserPoint{
struct Pt body;
struct Pt rightHand;
};


void setPoint(int x1, int y1, int x2, int y2){
    pthread_mutex_lock(&count_mutex);
    rect.x = x1;
    rect.y = y1;
    rect.width = abs(x2-x1);
    rect.height = abs(y2-y1);
    pthread_mutex_unlock(&count_mutex);
}



void *DataHandler(void *ptr){
    cout<<"!!!0.5!!!" <<endl;
    while(true){
        char server_reply[BUFFER_SIZE];
        memset(server_reply, '\0', sizeof(server_reply));
        int byte_Num;
        if(byte_Num = recv(sock, server_reply, BUFFER_SIZE, 0) < 0){
                cout<<"2" <<endl;
        cout<<"data :" << server_reply <<endl;
        }
     //   cout<<"data :" << server_reply <<endl;
        //parsing
        //server_reply[byte_Num] = '\0';
        cout<<"data :" << server_reply <<endl;
        
        string str(server_reply);
        string token;
        stringstream stream(str);
        int i = 0;
        stream>>token;
        int size = std::stoi(token);
        std::vector<UserPoint> keyPoints;
        for(int i=0;i<size;i++){
            UserPoint userPoint;
            stream>>token;
            userPoint.body.x = std::stoi(token);
            stream>>token;
            userPoint.body.y = std::stoi(token);
        
            stream>>token;
            userPoint.rightHand.x = std::stoi(token);
            stream>>token;
            userPoint.rightHand.y = std::stoi(token);
            keyPoints.push_back(userPoint);
        }
        for(int i=0;i<size;i++){
            cout<<"keyPoints:"<<(i+1)<<endl;
            cout<<"body:"<<keyPoints[i].body.x<<","<<keyPoints[i].body.y<<endl;
            cout<<"rightHand:"<<keyPoints[i].rightHand.x<<","<<keyPoints[i].rightHand.y<<endl;
        }
//        setPoint(point[0], point[1], point[2], point[3]);
    
    }
}

int main() {


    string servAddress = ADDR; // First arg: server address

    unsigned short servPort = Socket::resolveService(PORT_NUM, "udp");

    try {
/*tcp 연결*/
/*thread 생성부분 ... thread에서는 recv하여 전역변수 수정*/
        //tcp
        sockaddr_in server;
        pthread_t client_thread;

        //소켓 생성
        sock = socket(AF_INET, SOCK_STREAM, 0);
        if(sock == -1){
            cout << "소켓 생성에 실패하였습니다." << endl;
            exit(1);
        }
        cout << "TCP소켓을 생성하였습니다." << endl;

        //소켓 준비
        server.sin_family = AF_INET;
        server.sin_addr.s_addr = inet_addr(ADDR);
        server.sin_port = htons(stoi(PORT_NUM));



        //커넥트
        if(connect(sock, (struct sockaddr*)&server, sizeof(server)) < 0){
            cout<< "커넥트 에러" << endl;
            exit(1);
        }
        cout << "연결되었습니다." << endl;
        pthread_create(&client_thread, NULL, &DataHandler, NULL);

        //udp
        UDPSocket sock;
        int jpegqual =  ENCODE_QUALITY; // Compression Parameter

        Mat frame, send;
        vector < uchar > encoded;
        VideoCapture cap(0); // Grab the camera
        namedWindow("send", CV_WINDOW_AUTOSIZE);
        if (!cap.isOpened()) {
            cerr << "OpenCV Failed to open camera";
            exit(1);
        }

        clock_t last_cycle = clock();
        while (1) {
            cap >> frame;
            if(frame.size().width==0)continue;//simple integrity check; skip erroneous data...
            resize(frame, send, Size(FRAME_WIDTH, FRAME_HEIGHT), 0, 0, INTER_LINEAR);
            vector < int > compression_params;
            compression_params.push_back(CV_IMWRITE_JPEG_QUALITY);
            compression_params.push_back(jpegqual);

            imencode(".jpg", send, encoded, compression_params);
            /*Rect 이용 사각형 그리기*/
            rectangle(send, Point(rect.x, rect.y),Point(rect.x +rect.width, rect.y + rect.height),Scalar(0, 255, 0), 5);

            imshow("send", send);
            int total_pack = 1 + (encoded.size() - 1) / PACK_SIZE;

            int ibuf[1];
            ibuf[0] = total_pack;
            sock.sendTo(ibuf, sizeof(int), servAddress, servPort);

            for (int i = 0; i < total_pack; i++)
                sock.sendTo( & encoded[i * PACK_SIZE], PACK_SIZE, servAddress, servPort);

            waitKey(FRAME_INTERVAL);

            clock_t next_cycle = clock();
            double duration = (next_cycle - last_cycle) / (double) CLOCKS_PER_SEC;
         //   cout << "\teffective FPS:" << (1 / duration) << " \tkbps:" << (PACK_SIZE * total_pack / duration / 1024 * 8) << endl;

         //   cout << next_cycle - last_cycle;
            last_cycle = next_cycle;
        }
        // Destructor closes the socket

    } catch (SocketException & e) {
        cerr << e.what() << endl;
        exit(1);
    }

    return 0;
}
