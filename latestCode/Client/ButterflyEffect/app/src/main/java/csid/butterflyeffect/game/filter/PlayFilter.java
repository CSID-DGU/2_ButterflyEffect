package csid.butterflyeffect.game.filter;

import android.graphics.Bitmap;
import android.util.Log;

import java.util.ArrayList;

import csid.butterflyeffect.PreviewSurface;
import csid.butterflyeffect.game.BattleWorms;
import csid.butterflyeffect.game.Point2D;
import csid.butterflyeffect.game.model.UserInfo;
import csid.butterflyeffect.util.Constants;
import csid.butterflyeffect.util.Utils;

public class PlayFilter {
    private ArrayList<UserInfo> userInfos;
    private ArrayList<ArrayList<Point2D[]>> userInfoList;
    private BattleWorms battleWorms;

    public PlayFilter(ArrayList<UserInfo> userInfos,BattleWorms battleWorms) {
        this.battleWorms = battleWorms;
        this.userInfos = userInfos;
        userInfoList = new ArrayList<>();

    }

    //add init value of useres
    public void saveFirstUserInfo(){
        userInfoList.add(Utils.getPlainKeyPoint(userInfos));

        ArrayList<Point2D[]> userKeyPointsInfo = new ArrayList<>();
        for(int i=0;i<userInfos.size();i++)
            userKeyPointsInfo.add(userInfos.get(i).getKeyPoints());

        ArrayList<int[]> colors = getRGBFromPixels(userKeyPointsInfo);

        //save user's color information for each users.
        for(int i=0;i<userInfos.size();i++){
            int[] userColors = colors.get(i);
            for(int j=0;j<Constants.USER_COLOR_LISTS_NUM;j++){
                userInfos.get(i).addColor(userColors[j]);
            }
        }

    }

    //
    public void update() {
        ArrayList<Point2D[]> recentInfo;
        Point2D[] temp = new Point2D[Constants.KEYPOINT_NUM];
        for (int i = 0; i < Constants.KEYPOINT_NUM; i++) {
            temp[i] = new Point2D();
        }

        for (int user = 0; user < userInfos.size(); user++) {
            recentInfo = userInfoList.get(userInfoList.size() - 1);
            temp = recentInfo.get(userInfos.get(user).getUserNumber());
            userInfos.get(user).setKeyPoints(temp);
            //userInfos.get(user).setNeck(temp[Constants.NECK]);
            //userInfos.get(user).setNose(temp[Constants.NOSE]);
        }
    }

    public Point2D[] getRecentUserInfo(int userId) {
        ArrayList<Point2D[]> recentInfo = userInfoList.get(userInfoList.size() - 1);
        return recentInfo.get(userId);
    }

    public void insert(ArrayList<Point2D[]> userInfo) {
        //if user list is less than the size
        if (userInfoList.size() < Constants.USER_LIST_SIZE) {
            userInfoList.add(userInfo);
        } else {
            userInfoList.remove(0);
            userInfoList.add(userInfo);
        }
    }

    public Point2D[] getNominalKeyPoint() {
        Point2D[] nominalKeyPoint = new Point2D[Constants.KEYPOINT_NUM];
        for (int i = 0; i < Constants.KEYPOINT_NUM; i++) {
            if (i == Constants.NECK) {
                //for preventing zero degree
                nominalKeyPoint[i] = new Point2D(0, 1);
            } else {
                nominalKeyPoint[i] = new Point2D();
            }
        }
        return nominalKeyPoint;
    }

    public Point2D[] getDiedKeyPoint() {
        Point2D[] diedKeyPoint = new Point2D[Constants.KEYPOINT_NUM];
        for (int i = 0; i < Constants.KEYPOINT_NUM; i++) {
            diedKeyPoint[i] = new Point2D();
        }
        return diedKeyPoint;
    }


    public ArrayList<Point2D[]> filter(ArrayList<Point2D[]> peopleKeyPoints) {
        int userSize = userInfos.size();
        Point2D[][] result = new Point2D[userInfos.size()][Constants.KEYPOINT_NUM];
        for (int user = 0; user < userSize; user++) {
            int userNumber = userInfos.get(user).getUserNumber();
            if (!userInfos.get(user).isPlaying()) {
                result[userNumber] = getNominalKeyPoint();
            }
            else{

                Point2D neck = userInfos.get(user).getKeyPoints()[Constants.NECK];
                ArrayList<Point2D[]> candidatesKeyPoints = new ArrayList<>();
                //int candidate = -1;
                int peopleSize = peopleKeyPoints.size();

                double minNose = Integer.MAX_VALUE;
                double minNeck = Integer.MAX_VALUE;

                //TODO if that player is died player then add diedPoint.
                //If the OpenPose didn't detect correctly key points or User died
                if (neck.x == 0 && neck.y == 0) {
                    //If the user had died
                    result[userNumber] = getRecentUserInfo(userNumber);
                }
                //If the OpenPose correctly detected the key points
                else {
                    //Check all key points in frame to detect user
                    for (int people = 0; people < peopleSize; people++) {
                        Point2D[] keyPoints = peopleKeyPoints.get(people);
                        //Calculate the distance between user neck and person's neck in frame
                        double distanceNeck = Utils.getDistance(neck, keyPoints[Constants.NECK]);
                        //double distanceNose = Utils.getDistance(nose, keyPoints[Constants.NOSE]);
                        //Select the nearest distance
                        //if(distanceNeck<Constants.PLAYER_RADIUS){
                        if (distanceNeck < Constants.PLAYER_RADIUS && distanceNeck < minNeck) {
                            minNeck = distanceNeck;
                            candidatesKeyPoints.add(keyPoints);
                        }
                    }
                    Log.d("#####","candidates:"+candidatesKeyPoints.size());
                    //If the filter didn't find the targeted user as the user was died or previous distance was too small.
                    if (candidatesKeyPoints.size() == 0) {
                        //If the user had died
                        result[userNumber] = getRecentUserInfo(userNumber);
                    }
                    else if(candidatesKeyPoints.size() == 1){
                        //TODO 색 정보 갱신하는 것도 생각해보기
                        //If the filter find the targeted user
                        result[userNumber] = candidatesKeyPoints.get(0);
                        deleteFromKeyPoints(peopleKeyPoints,result[userNumber][Constants.NECK]);

                    }
                    else {//multiple candidate, so color filter applied
                        result[userNumber] = filter(userInfos.get(user).getColors(), candidatesKeyPoints);
                        deleteFromKeyPoints(peopleKeyPoints,result[userNumber][Constants.NECK]);
                    }
                }
            }
        }



        //change Point2D[][] to arraylist<Point2D[]>
        ArrayList<Point2D[]> rtnPoints = new ArrayList<>();
        for (int i = 0; i < userInfos.size(); i++) {
            rtnPoints.add(result[i]);
        }

        //Save the best three people in frame
        insert(rtnPoints);

        //Update the old key points to new key points to draw correct skeletons.
        update();

        //Return the result, result has key points of user1, user2, user3
        return rtnPoints;
    }

    public void deleteFromKeyPoints(ArrayList<Point2D[]> peopleKeyPoints,Point2D targetUserNeck){
        int index = -1;
        for(int i=0;i<peopleKeyPoints.size();i++){
            Point2D neck = peopleKeyPoints.get(i)[Constants.NECK];
            if(neck.x ==targetUserNeck.x && neck.y == targetUserNeck.y){
                index = i;
                break;
            }
        }
        peopleKeyPoints.remove(index);
    }

    //filter Overloading
    public Point2D[] filter(ArrayList<Integer> userColors, ArrayList<Point2D[]> candidatesKeyPoints) {
        int userColorsSize = userColors.size();
        int result = -1;
        int[] colorDiff = new int[candidatesKeyPoints.size()];
        //Calculate color difference
         for(int i = 0; i < candidatesKeyPoints.size(); i++) {
            colorDiff[i] = 0;
            for(int j = 0; j < 1; j++) {
                int candidateColor = getRGBFromPixel(candidatesKeyPoints.get(i)[Constants.COLOR_LISTS_NAME[j]]);
                Log.d("#####","user "+(i+1)+"("+j+") color: "+String.valueOf(candidateColor));
                colorDiff[i] += Math.abs(candidateColor - userColors.get(j));
            }
        }

        //Pick minimum diff
        int minDiff = Integer.MAX_VALUE;
        for(int i = 0; i < candidatesKeyPoints.size(); i++){
            if(colorDiff[i] < minDiff){
                minDiff = colorDiff[i];
                result = i;
            }
        }
        return candidatesKeyPoints.get(result);
    }

    public int getRGBFromPixel(Point2D target){

        Bitmap bitmap;
        do {
            bitmap = PreviewSurface.curFrameImage();
        }while(bitmap==null);

        Point2D pureXY = Utils.getPureCoordinates(bitmap,target);
        //it is because we will get pixel from raw frame of camera.

        return bitmap.getPixel((int)pureXY.x, (int)pureXY.y);
    }

    public ArrayList<int[]> getRGBFromPixels(ArrayList<Point2D[]> userKeyPointsInfo) {
        ArrayList<int[]> colors = new ArrayList<>();

       // int[] colors = new int[positions.size()];
        Bitmap bitmap = PreviewSurface.curFrameImage();

        for(int i=0;i<userKeyPointsInfo.size();i++){
            Point2D[] targets = new Point2D[Constants.USER_COLOR_LISTS_NUM];
            for(int j=0;j<Constants.USER_COLOR_LISTS_NUM;j++)
                targets[j] = Utils.getPureCoordinates(bitmap,userKeyPointsInfo.get(i)[Constants.COLOR_LISTS_NAME[j]]);

            //it is because we will get pixel from raw frame of camera.
            int[] userColors = new int[Constants.USER_COLOR_LISTS_NUM];
            for(int j=0;j<Constants.USER_COLOR_LISTS_NUM;j++){
                //TODO 이곳에서 x 가 음수면 프로그램이 죽음!
                userColors[j] = bitmap.getPixel((int)targets[j].x, (int)targets[j].y);
            }
            colors.add(userColors);
        }

        return colors;
    }
}
