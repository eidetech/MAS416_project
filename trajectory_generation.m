clc; clear all; close all;

% Position and time vectors
x = [2000 2000 1600 1600 2000];
y = [500 -500 500 0 500];
z = [1600 1600 900 900 1600];
t = [0 1 2 3 4];

[px,vx,ax,t_tot] = trajGen(t,x);
[py,vy,ay,t_tot] = trajGen(t,y);
[pz,vz,az,t_tot] = trajGen(t,z);

% Plot position, velocity and acceleration for the path
subplot(3,3,1)
plot(t,x, 'o')
hold on
plot(t_tot, px)
subplot(3,3,4)
plot(t_tot, vx)
subplot(3,3,7)
plot(t_tot, ax)

subplot(3,3,2)
plot(t,y, 'o')
hold on
plot(t_tot, py)
subplot(3,3,5)
plot(t_tot, vy)
subplot(3,3,8)
plot(t_tot, ay)

subplot(3,3,3)
plot(t,z, 'o')
hold on
plot(t_tot, pz)
subplot(3,3,6)
plot(t_tot, vz)
subplot(3,3,9)
plot(t_tot, az)

function [p,v,a,t_tot] = trajGen(t,x)
% Preallocate matrix and vector sizes and init to zero
A = zeros(18, 18);
B = zeros(18,1);

% Column 1 (1:5)
A(1,1:5) = F4(t(1));
A(2,1:5) = F4Dot(t(1));
A(3,1:5) = F4Dotdot(t(1));
A(4,1:5) = F4(t(2));
A(5,1:5) = F4(t(2));
A(6,1:5) = F4Dot(t(2));
A(7,1:5) = F4Dotdot(t(2));

% Column 2 (6:9)
A(5,6:9) = -F3(t(2));
A(6,6:9) = -F3Dot(t(2));
A(7,6:9) = -F3Dotdot(t(2));
A(8,6:9) = F3(t(3));
A(9,6:9) = F3(t(3));
A(10,6:9) = F3Dot(t(3));
A(11,6:9) = F3Dotdot(t(3));

% Column 3 (10:13)
A(9, 10:13) = -F3(t(3));
A(10, 10:13) = -F3Dot(t(3));
A(11, 10:13) = -F3Dotdot(t(3));
A(12, 10:13) = F3(t(4));
A(13, 10:13) = F3(t(4));
A(14, 10:13) = F3Dot(t(4));
A(15, 10:13) = F3Dotdot(t(4));

% Column 4 (14:18)
A(13, 14:18) = -F4(t(4));
A(14, 14:18) = -F4Dot(t(4));
A(15, 14:18) = -F4Dotdot(t(4));
A(16, 14:18) = F4(t(5));
A(17, 14:18) = F4Dot(t(5));
A(18, 14:18) = F4Dotdot(t(5));

% Right hand side
B(1) = x(1);
B(4) = x(2);
B(8) = x(3);
B(12) = x(4);
B(16) = x(5);

% Solve for coefficients
coeff = A\B;

% Extract coefficients from x vector
a = coeff(1:5);
b = coeff(6:9);
c = coeff(10:13);
d = coeff(14:18);

% Define timestep
dt = 10^-3;

% Make time vectors with given timestep
t1 = 0:dt:t(2);
t2 = t(2):dt:t(3);
t3 = t(3):dt:t(4);
t4 = t(4):dt:t(5);

% Total time for the complete trajectory
ttot = 0:dt:t(5);

% First path
for i = 1:length(t1)
    x1 = F4(t1(i))*a;
    v1 = F4Dot(t1(i))*a;
    a1 = F4Dotdot(t1(i))*a;

    xplt(i) = x1;
    vplt(i) = v1;
    aplt(i) = a1;
end

% Second path
for i = 1:length(t2)
    x2 = F3(t2(i))*b;
    v2 = F3Dot(t2(i))*b;
    a2 = F3Dotdot(t2(i))*b;

    xplt(i+length(t1)-1) = x2;
    vplt(i+length(t1)-1) = v2;
    aplt(i+length(t1)-1) = a2;
end

% Third path
for i = 1:length(t3)
    x3 = F3(t3(i))*c;
    v3 = F3Dot(t3(i))*c;
    a3 = F3Dotdot(t3(i))*c;

    xplt(i+2*length(t2)-2) = x3;
    vplt(i+2*length(t2)-2) = v3;
    aplt(i+2*length(t2)-2) = a3;
end

% Last path
for i = 1:length(t4)
    x4 = F4(t4(i))*d;
    v4 = F4Dot(t4(i))*d;
    a4 = F4Dotdot(t4(i))*d;

    xplt(i+3*length(t2)-3) = x4;
    vplt(i+3*length(t2)-3) = v4;
    aplt(i+3*length(t2)-3) = a4;
end
p = xplt;
v = vplt;
a = aplt;
t_tot = ttot;
end

% Functions for time vectors
function [output] = F4(t)
output = [1 t t^2 t^3 t^4];
end

function [output] = F4Dot(t)
output = [0 1 2*t 3*t^2 4*t^3];
end

function [output] = F4Dotdot(t)
output = [0 0 2 6*t 12*t^2];
end
function [output] = F3(t)
output = [1 t t^2 t^3];
end

function [output] = F3Dot(t)
output = [0 1 2*t 3*t^2];
end

function [output] = F3Dotdot(t)
output = [0 0 2 6*t];
end