clc; clear;

disp('===== MATRIX TOOL =====');
disp('1. Dinh thuc (det)');
disp('2. Hang ma tran (rank)');
disp('3. Nghich dao (inv)');
disp('4. Chuyen vi (transpose)');
disp('5. Giai he AX = B');
disp('6. Tri rieng & Vector rieng');
disp('7. Kiem tra kha nghich');
choice = input('Chon chuc nang: ');

switch choice
    case 1
        calc_det();
    case 2
        calc_rank();
    case 3
        calc_inv();
    case 4
        calc_transpose();
    case 5
        solve_linear();
    case 6
        eigen_calc();
    case 7
        invertible_check();
    otherwise
        disp('Lua chon khong hop le!');
end
function calc_det()
A = input('Nhap ma tran A: ');
disp('det(A) = ');
disp(det(A));
end
function calc_rank()
A = input('Nhap ma tran A: ');
disp('rank(A) = ');
disp(rank(A));
end
function calc_inv()
A = input('Nhap ma tran A: ');
if det(A) == 0
    disp('Ma tran KHONG kha nghich!');
else
    disp('inv(A) = ');
    disp(inv(A));
end
end
function calc_transpose()
A = input('Nhap ma tran A: ');
disp('A^T = ');
disp(A.');
end
function solve_linear()
A = input('Nhap ma tran A: ');
B = input('Nhap vector B: ');

if det(A) == 0
    disp('He vo nghiem hoac vo so nghiem!');
else
    X = A \ B;
    disp('Nghiem X = ');
    disp(X);
end
end
function eigen_calc()
A = input('Nhap ma tran A: ');
[V,D] = eig(A);

disp('Tri rieng (D) = ');
disp(D);

disp('Vector rieng (V) = ');
disp(V);
end
function invertible_check()
A = input('Nhap ma tran A: ');

if rank(A) == size(A,1)
    disp('Ma tran KHA NGHICH');
else
    disp('Ma tran KHONG kha nghich');
end
end
