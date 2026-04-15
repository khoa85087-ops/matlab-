clc; clear; close all;

% do dai
a1=30; a2=30; a3=30;

% diem
Ax=10; Ay=20;
Bx=10; By=10;
Cx=20; Cy=10;

% ===== 1. Quỹ đạo với profile thời gian =====

t1 = 2;            % A->B
t2 = 1;            % B->C
t3 = 2*sqrt(2);    % C->A

t = linspace(0, t1+t2+t3, 200);

xp = zeros(size(t));
yp = zeros(size(t));

for i=1:length(t)
    if t(i) <= t1
        % ===== A -> B (tăng dần đều) =====
        tau = t(i)/t1;          % chuẩn hóa 0→1
        s = tau^2;              % tăng dần đều

        xp(i) = Ax + (Bx-Ax)*s;
        yp(i) = Ay + (By-Ay)*s;

    elseif t(i) <= t1 + t2
        % ===== B -> C (v không đổi) =====
        tau = (t(i)-t1)/t2;
        s = tau;

        xp(i) = Bx + (Cx-Bx)*s;
        yp(i) = By + (Cy-By)*s;

    else
        % ===== C -> A (giảm dần đều) =====
        tau = (t(i)-t1-t2)/t3;
        s = 1 - (1 - tau)^2;   % giảm dần đều

        xp(i) = Cx + (Ax-Cx)*s;
        yp(i) = Cy + (Ay-Cy)*s;
    end
end

% ===== 2. IK =====
q1 = zeros(size(t));
q2 = zeros(size(t));

for i=1:length(t)
    x = xp(i);
    y = yp(i) - a3;

    D = (x^2 + y^2 - a1^2 - a2^2)/(2*a1*a2);
    D = max(min(D,1),-1);

    q2(i) = acos(D);
    q1(i) = atan2(y,x) - atan2(a2*sin(q2(i)), a1 + a2*cos(q2(i)));
end

q3 = pi/2 - (q1 + q2);

figure;

while true   % lặp vô hạn

    for i=1:length(t)
        % cac diem khop
        x0=0; y0=0;
        x1 = a1*cos(q1(i));
        y1 = a1*sin(q1(i));
        
        x2 = x1 + a2*cos(q1(i)+q2(i));
        y2 = y1 + a2*sin(q1(i)+q2(i));
        
        x3 = x2 + a3*cos(q1(i)+q2(i)+q3(i));
        y3 = y2 + a3*sin(q1(i)+q2(i)+q3(i));

        cla; % xóa frame cũ (mượt hơn hold off)

        % ve robot
        plot([x0 x1 x2 x3],[y0 y1 y2 y3],'o-','LineWidth',2); hold on;
        
        % quỹ đạo
        plot(xp, yp,'r--');
        
        % điểm hiện tại
        plot(x3,y3,'ro','MarkerSize',6,'MarkerFaceColor','r');

        % A B C
        scatter([Ax Bx Cx],[Ay By Cy],50,'filled');
        text(Ax, Ay, '  A','FontSize',12);
        text(Bx, By, '  B','FontSize',12);
        text(Cx, Cy, '  C','FontSize',12);

        axis equal;
        grid on;
        xlim([-60 60]); ylim([-60 60]);
        title('Robot RRR chuyển động A → B → C → A');

        drawnow;
        pause(0.01); % chỉnh tốc độ (nhỏ = nhanh)
    end

end
