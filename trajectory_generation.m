clc; clear all; close all;

% Position and time vectors
x = [1 4 3 6];
t = [0 1 2 3];

% Preallocate matrix and vector sizes and init to zero
A = zeros(14, 14);
B = zeros(14,1);

% Column 1 (1:5)
A(1,1:5) = F4(t(1));
A(2,1:5) = F4Dot(t(1));
A(3,1:5) = F4Dotdot(t(1));
A(4,1:5) = F4(t(2));
A(5,1:5) = F4(t(2));
A(6, 1:5) = F4Dot(t(2));
A(7, 1:5) = F4Dotdot(t(2));

% Column 2 (6:9)
A(5, 6:9) = -F3(t(2));
A(6, 6:9) = -F3Dot(t(2));
A(7, 6:9) = -F3Dotdot(t(2));
A(8, 6:9) = F3(t(3));
A(9, 6:9) = F3(t(3));
A(10, 6:9) = F3Dot(t(3));
A(11, 6:9) = F3Dotdot(t(3));

% Column 3 (10:14)
A(9, 10:14) = -F4(t(3));
A(10, 10:14) = -F4Dot(t(3));
A(11, 10:14) = -F4Dotdot(t(3));
A(12, 10:14) = F4(t(4));
A(13, 10:14) = F4Dot(t(4));
A(14, 10:14) = F4Dotdot(t(4));

% Right hand side
B(1) = x(1);
B(4) = x(2);
B(8) = x(3);
B(12) = x(4);

% Solve for coefficients
x = A\B;

% Extract coefficients from x vector
a = x(1:5);
b = x(6:9);
c = x(10:14);

% Define timestep
dt = 10^-3;

% Make time vectors with given timestep
t1 = 0:dt:t(2);
t2 = t(2):dt:t(3);
t3 = t(3):dt:t(4);

% Total time for the complete trajectory
ttot = 0:dt:t(4);

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

    xplt(i+length(t2)-2) = x2;
    vplt(i+length(t2)-2) = v2;
    aplt(i+length(t2)-2) = a2;
end

% Last path
for i = 1:length(t3)
    x3 = F4(t3(i))*c;
    v3 = F4Dot(t3(i))*c;
    a3 = F4Dotdot(t3(i))*c;

    xplt(i+2*length(t2)-2) = x3;
    vplt(i+2*length(t2)-2) = v3;
    aplt(i+2*length(t2)-2) = a3;
end

% Plot position, velocity and acceleration for the path
subplot(3,1,1)
plot(ttot, xplt)
subplot(3,1,2)
plot(ttot, vplt)
subplot(3,1,3)
plot(ttot, aplt) 

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