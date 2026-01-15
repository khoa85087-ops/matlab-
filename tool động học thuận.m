% ===== 1. Nhap goc quay =====
theta = input('Nhap goc quay (rad): ');
axis = input('Nhap truc quay (x / y / z): ', 's');

% ===== 2. Ma tran quay =====
switch lower(axis)
    case 'x'
        R = [1 0 0;
             0 cos(theta) -sin(theta);
             0 sin(theta)  cos(theta)];
    case 'y'
        R = [ cos(theta) 0 sin(theta);
              0          1 0;
             -sin(theta) 0 cos(theta)];
    case 'z'
        R = [ cos(theta) -sin(theta) 0;
              sin(theta)  cos(theta) 0;
              0           0          1];
    otherwise
        error('Truc quay khong hop le!');
end

disp('Ma tran quay R = ');
disp(R);

% ===== 3. Nhap toa do tinh tien =====
px = input('Nhap tinh tien theo x: ');
py = input('Nhap tinh tien theo y: ');
pz = input('Nhap tinh tien theo z: ');

p = [px; py; pz];

% ===== 4. Ma tran dong nhat 4x4 =====
T = [R p;
     0 0 0 1];

disp('Ma tran dong nhat T = ');
disp(T);

% ===== 5. (Tu chon) Nhap diem can bien doi =====
choice = input('Ban co muon bien doi 1 diem? (y/n): ', 's');

if lower(choice) == 'y'
    x = input('Nhap x cua diem: ');
    y = input('Nhap y cua diem: ');
    z = input('Nhap z cua diem: ');

    p0 = [x; y; z; 1];
    p1 = T * p0;

    disp('Toa do diem sau bien doi: ');
    disp(p1);
end
