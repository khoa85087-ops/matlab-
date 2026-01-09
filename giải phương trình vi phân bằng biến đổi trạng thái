%ode45=tuyen tinh+tac dong ben ngoai 
%input=dao ham,gt ban dau,khoan 
%output=khoan theo thoi gian

A = [-1 0; 0 -2]; % ma trận hệ
B=[1;5] ;% tac dong ben ngoai 
x0 = [1; 2];         % trạng thái ban đầu
khoan = [0 100];       % khoảng thời gian quan sát

u = @(t) sin(t);%ham tac dong ben ngoai 
dx = @(t, x) A*x+B*u(t);  % hàm đạo hàm tuyen tinh 


[t, x] = ode45(dx, khoan, x0);


plot(t,x(:,1),"r");
hold on 
plot(t,x(:,2),"b")
xlabel('Thời gian (s)')
ylabel('Biên độ')
title('Đồ thị ')
grid on
