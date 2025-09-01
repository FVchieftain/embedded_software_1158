function init_eso_ros()
% ===== 샘플타임(모델과 동일) =====
Ts = 0.05;   % 예: 50 ms. 네 모델 주기에 맞춰 수정

% ===== 평지 기반 이산 모델 (D=0 가정) =====
numz = [0 0.022510 0.067529 0.067529 0.022510];
denz = [1.0     -1.1104   0.2463    0.0448];
Gz   = tf(numz, denz, Ts);
[Ad,Bd,Cd,~] = dssdata(ss(Gz));
nx = size(Ad,1);

% ===== 증강(외란 상태 포함) =====
A_aug = [Ad, Bd; zeros(1,nx), 1];
B_aug = [Bd; 0];
C_aug = [Cd, 0];

% ===== 관측기 이득 L (DLQR 이중성) =====
Q = diag([ones(1,nx), 10]);  % 전환 빨리하려면 50~200 등으로 키워도 됨
R = 1;
L  = dlqr(A_aug', C_aug', Q, R)';

% ===== ESO(관측기형) 행렬 =====
Aobs = A_aug - L*C_aug;
Bobs = [B_aug-L, L];     % 입력 = [u; y]
Cobs = eye(nx+1);
Dobs = zeros(nx+1,2);
z0   = zeros(nx+1,1);

% ===== 워크스페이스에 배포 =====
assignin('base','Ts',Ts);
assignin('base','Aobs',Aobs);
assignin('base','Bobs',Bobs);
assignin('base','Cobs',Cobs);
assignin('base','Dobs',Dobs);
assignin('base','z0',z0);
assignin('base','C_aug',C_aug);
assignin('base','nx',nx);

% ===== 빠른 안정성 체크(선택) =====
if max(abs(eig(Aobs))) >= 1
    warning('ESO 관측기 고유값이 단위원 밖입니다. Q(end,end)를 키워보세요.');
end
end
