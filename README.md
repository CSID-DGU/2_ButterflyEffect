﻿
**2조 나비효과 - 영상인식기술을 활용한 동작인식 시스템**
- 한승범, 나선엽, 김상연

## Contents
1. [Results](#results)
2. [Our Development Diary](#our-development-diary)
3. [More Information](#more-information)

## Results

#### Demo & Environment

<p align="center">
    <img src="doc/multi_game.gif", width="400">
    <img src="doc/demo_environment.png", width="360">
</p>

---

#### Software architecture & Internal logic

<p align="center">
    <img src="doc/structure.png", width="400">
    <img src="doc/structure_detail.png", width="450">
</p>

## Our Development Diary

- **17.10.05 : simple client-server face tracking program**

<p align="center">
    <img src="doc/simple_server_client.png", width="600">
</p>

This is the program we first created for the project. 
It is designed to create the **overall framework** of the project. 
The framework of our project is as follows.
   
	1. send real-time image frames from client to server.
	2. send the value of interpreting frame using openpose.
	3. reflects the values in BattleWorms.

AWS Server is needed because openpose requring a high-quilty-computer is difficult to develop on a personal computer. but at this program, we used **simple-face-detection-module** instead of using **openpose** since we had not yet analyzed it.

---

- 17.10.30 : openpose analysis
- 17.11.20 : applied openpose to our simple program
- 17.12.04 : completed BattleWorms for a single player
- 18.02.22 : changed our program architecture
- 18.03.18 : completed BattleWorms for 3 players
- ~ adding game effect and enhancing color-based filter 

## More Information

- Filter (How we distinguish players between different people)
- Game rules
- How BattleWorms started

## OpenSource

We are making our program using OpenPose!

OpenPose is authored by [Gines Hidalgo](https://www.gineshidalgo.com/), [Zhe Cao](http://www.andrew.cmu.edu/user/zhecao), [Tomas Simon](http://www.cs.cmu.edu/~tsimon/), [Shih-En Wei](https://scholar.google.com/citations?user=sFQD3k4AAAAJ&hl=en), [Hanbyul Joo](http://www.cs.cmu.edu/~hanbyulj/), and [Yaser Sheikh](http://www.cs.cmu.edu/~yaser/). Currently, it is being maintained by [Gines Hidalgo](https://www.gineshidalgo.com/) and [Bikramjot Hanzra](https://www.linkedin.com/in/bikz05). The [original CVPR 2017 repo](https://github.com/ZheC/Multi-Person-Pose-Estimation) includes Matlab and Python versions, as well as the training code. The body pose estimation work is based on [the original ECCV 2016 demo](https://github.com/CMU-Perceptual-Computing-Lab/caffe_rtpose).

## License
This program follows the licensing of the OpenPose. freely available for free non-commercial use, and may be redistributed under these conditions. Please, see the [license](LICENSE) for further details. 
