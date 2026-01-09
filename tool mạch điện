

disp('=== TOOL TINH TOAN MACH DIEN CO BAN ===');
disp('1. Mach DC - Dinh luat Ohm');
disp('2. Mach DC - Noi tiep / Song song');
disp('3. Mach AC 1 pha (R-L-C)');
choice = input('Chon chuc nang: ');

switch choice
    case 1
        dc_ohm();
    case 2
        dc_series_parallel();
    case 3
        ac_rlc();
    otherwise
        disp('Lua chon khong hop le!');
end
function dc_ohm()
disp('--- Mach DC (Ohm) ---');
U = input('Nhap dien ap U (V): ');
R = input('Nhap dien tro R (Ohm): ');

I = U / R;
P = U * I;

fprintf('Dong dien I = %.4f A\n', I);
fprintf('Cong suat P = %.4f W\n', P);
end
function dc_series_parallel()
disp('1. Noi tiep');
disp('2. Song song');
type = input('Chon kieu mach: ');

n = input('So dien tro: ');
R = zeros(1,n);

for i = 1:n
    R(i) = input(['R' num2str(i) ' = ']);
end

switch type
    case 1
        Req = sum(R);
    case 2
        Req = 1 / sum(1./R);
    otherwise
        disp('Lua chon sai!');
        return;
end

fprintf('Dien tro tuong duong Req = %.4f Ohm\n', Req);
end
function ac_rlc()
disp('--- Mach AC 1 pha RLC ---');

R = input('Nhap R (Ohm): ');
L = input('Nhap L (H): ');
C = input('Nhap C (F): ');
f = input('Nhap tan so f (Hz): ');
U = input('Nhap dien ap RMS U (V): ');

w = 2*pi*f;
XL = w*L;
XC = 1/(w*C);

Z = sqrt(R^2 + (XL - XC)^2);
I = U / Z;

phi = atan((XL - XC)/R);

P = U * I * cos(phi);
Q = U * I * sin(phi);
S = U * I;

fprintf('Z = %.4f Ohm\n', Z);
fprintf('I = %.4f A\n', I);
fprintf('cos(phi) = %.4f\n', cos(phi));
fprintf('P = %.4f W\n', P);
fprintf('Q = %.4f VAR\n', Q);
fprintf('S = %.4f VA\n', S);
end
