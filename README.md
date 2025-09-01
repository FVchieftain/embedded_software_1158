# embedded_software_1158

## how to use
1. 이 파일들을 모두 다운로드한 후 매트랩 폴더 내부에 저장
<img width="600" height="300" alt="Image" src="https://github.com/user-attachments/assets/aa847663-dd47-4ba6-a71a-97c3ef7f7cb1" />
  



2. 매트랩 명령창에서 init_eso_ros.m 파일 실행
<img width="2879" height="1340" alt="Image" src="https://github.com/user-attachments/assets/0442584c-f512-4b78-9647-eda88c6c9392" />



  
3. 매트랩 명령창에서 다음 코드를 입력
 ```matlab
Plant_linear = c2d(tf([4985], [1, 69.18, 1044.3, 5000]), Ts, 'tustin');
[A,B,C,D] = ssdata(Plant_linear);
D(:) = 0;   % D행렬을 0으로 강제
Plant_ss = ss(A,B,C,D,Ts);
mpc_linear = mpc(Plant_ss, Ts);
```


  
4. simulink에서 hybrid_controller_handmade_v1.slx 실행




  
5. simulink에서 signal editor 설정
<img width="400" height="500" alt="Image" src="https://github.com/user-attachments/assets/7c7a037a-b1fd-41e4-839c-cd152fcfc1c1" />

다운로드한 신호 파일을 선택


  
6. simulink에서 mpc 파라미터 설정
<img width="500" height="400" alt="Image" src="https://github.com/user-attachments/assets/adf3d859-6956-477e-9368-e6b338214f42" />

Tuning 탭에서 Prediction Horizon = 20, Control Horizon = 2 로 설정

Design의 Constraints, Weights를 다음과 같이 수정

<img width="500" height="400" alt="Image" src="https://github.com/user-attachments/assets/4f070621-2f60-4885-a20c-ba431fb23c88" />
<img width="500" height="400" alt="Image" src="https://github.com/user-attachments/assets/402b4825-4142-40dd-a087-440c72557e3b" />



7. 원격 PC 접속

원격 PC로 터틀봇 연결 후 bringup 실행(Putty or SSH)

```bash
ros2 launch turtlebot3_bringup robot.launch.py
```


  
8. ROS2 연결

매트랩 명령창에서 다음 명령어를 입력
ros domain은 로봇마다 달라서 각자 해당하는 값으로 변경

```matlab
setenv("ROS_DOMAIN_ID","30")
setenv("RMW_IMPLEMENTATION","rmw_fastrtps_cpp")
```
