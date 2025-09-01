# embedded_software_1158

## how to use
1. 이 파일들을 모두 다운로드한 후 매트랩 폴더 내부에 저장
<img width="634" height="288" alt="Image" src="https://github.com/user-attachments/assets/aa847663-dd47-4ba6-a71a-97c3ef7f7cb1" />
  



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
<img width="839" height="1035" alt="Image" src="https://github.com/user-attachments/assets/7c7a037a-b1fd-41e4-839c-cd152fcfc1c1" />

다운로드한 신호 파일을 선택


  
6. simulink에서 mpc 파라미터 설정
<img width="1078" height="972" alt="Image" src="https://github.com/user-attachments/assets/adf3d859-6956-477e-9368-e6b338214f42" />

Tuning 탭에서 Prediction Horizon = 20, Control Horizon = 2 
Design의 Constraints, Weights를 다음과 같이 수정
<img width="1394" height="1250" alt="Image" src="https://github.com/user-attachments/assets/4f070621-2f60-4885-a20c-ba431fb23c88" />
<img width="1116" height="882" alt="Image" src="https://github.com/user-attachments/assets/c500b5fd-fb15-47c6-8a5c-665f33ed14aa" />



