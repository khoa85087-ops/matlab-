% ve 2d thi can 2 arr x;y 

x=0:0.1:10;%x chay tu 0 den 10 step 0.1
y=sin(x)+cos(x);
plot(x,y,"b")
xlabel('Thời gian (s)')
ylabel('Biên độ')
title('Đồ thị hàm Sin')
grid on
