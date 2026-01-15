function plot_tool
clc; clear; syms x;
disp('===== FUNCTION PLOT TOOL =====');
disp('Vi du: sin(x), x^2+3*x, exp(-x)*sin(x)');
f = input('Nhap ham f(x): ');
a = input('Nhap can duoi a: ');
b = input('Nhap can tren b: ');
figure;
fplot(f,[a b],'LineWidth',2);
grid on;
xlabel('x');
ylabel('f(x)');
title('Do thi ham so');
end
