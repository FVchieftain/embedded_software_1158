# embedded_software_1158

## how to use
1. 이 파일들을 모두 다운로드한 후 매트랩 폴더 내부에 저장
<img width="634" height="288" alt="Image" src="https://github.com/user-attachments/assets/aa847663-dd47-4ba6-a71a-97c3ef7f7cb1" />

2. 매트랩 명령창에서 init_eso_ros.m 파일 실행
<img width="2879" height="1340" alt="Image" src="https://github.com/user-attachments/assets/0442584c-f512-4b78-9647-eda88c6c9392" />

3. 매트랩 명령창에서 다음 코드를 입력
 ```matlab
 % This is a sample MATLAB code block
Plant_linear = c2d(tf([4985], [1, 69.18, 1044.3, 5000]), Ts, 'tustin');
[A,B,C,D] = ssdata(Plant_linear);
D(:) = 0;   % D행렬을 0으로 강제
Plant_ss = ss(A,B,C,D,Ts);
mpc_linear = mpc(Plant_ss, Ts);

4. simulink에서 hybrid_controller_handmade_v1.slx 실행


5. simulink에서 signal editor 설정


6. simulink에서 mpc 파라미터 설정
