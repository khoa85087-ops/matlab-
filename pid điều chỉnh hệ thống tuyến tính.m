%input=kp,ki,kd, điểm hiện tại(0,0,0),điểm đặt,he thong A,tac dong B
%output= su thay doi {vi tri (1),van toc(2),sai so (3)}
%bac n=thay doi A,B,X0,U,Dx_ss

%% --- Hệ thống bậc 3 ---
A = [0, 1, 0;
     0, 0, 1;
    -3, -4, -5]; % Ma trận trạng thái 3x3
B = [0; 0; 1];   % Ma trận đầu vào 3x1

%% 2. Thông số PID
list.Kp =2.819; 
list.Ki = 1.59;
list.Kd = 1.25;
list.set = 1;
list.A = A;
list.B = B;

time = [0 10];
% Trạng thái ban đầu: [x1; x2; x3; tích phân sai số]
x0 = [0; 0; 0; 0]; % 3 trạng thái + 1 tích phân

%% 3. Giải phương trình
pid_f = @(t, x) robot_pid_matrix_3(t, x, list);
[t, x] = ode45(pid_f, time, x0);

y = x(:, 1); % Vị trí x1

%% 4. Vẽ kết quả
figure;
plot(t, y, 'b'); 
hold on;
yline(list.set, 'r--');
grid on;
xlabel('Thời gian (s)'); ylabel('Vị trí (rad)');
title('Điều khiển Robot dùng PID dạng Ma Trận (Bậc 3)');

%% --- Hàm định nghĩa hệ Robot bậc 3 ---
function dx = robot_pid_matrix_3(t, x, p)
    % x(1:3): 3 trạng thái hệ thống
    % x(4)  : tổng sai số tích lũy (Integral)

    % --- 1. Tính sai số ---
    sai_so = p.set - x(1);       % Sai số vị trí
    dao_ham_sai_so = 0 - x(2);   % Tốc độ thay đổi sai số

    % --- 2. Tín hiệu điều khiển PID ---
    u = p.Kp*sai_so + p.Ki*x(4) + p.Kd*dao_ham_sai_so;

    % --- 3. Phương trình trạng thái ---
    dx_system = p.A * x(1:3) + p.B * u; % dx1/dt, dx2/dt, dx3/dt

    % --- 4. Đạo hàm của biến tích phân ---
    dz = sai_so; % dz/dt = sai số hiện tại

    % --- 5. Vector đạo hàm tổng quát ---
    dx = [dx_system; dz];
end
% Chuyển ma trận trạng thái thành hàm truyền (Transfer Function)
%sys = ss(A, B, [1 zeros(1, size(A,1)-1)], 0); 

% Mở công cụ PID Tuner
%pidtool(sys, 'PID')
