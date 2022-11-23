clc; clear all; close all;

% Position (xyz) and time vectors
x = [2 2 1.6 1.6 2];
y = [0.5 -0.5 0.5 0 0.5];
z = [1.6 1.6 0.9 0.9 1.6];
t = [0 0.7 1.5 2 3];
t_current = 0;
dt = 10^-3;
idx = 1;
% Calculate position, velocity and acceleration for xyz
while(t_current <= t(5))
[px,vx,ax] = trajGen(t,x, t_current);
[py,vy,ay] = trajGen(t,y, t_current);
[pz,vz,az] = trajGen(t,z, t_current);
t_tot(idx) = t_current;
pxplt(idx) = px;
vxplt(idx) = vx;
axplt(idx) = ax;

pyplt(idx) = py;
vyplt(idx) = vy;
ayplt(idx) = ay;

pzplt(idx) = pz;
vzplt(idx) = vz;
azplt(idx) = az;

% if(t_current < t(2))
%     t1(idx) = t_current;
%     P1(idx) = px;
% end

idx = idx + 1;
t_current = t_current + dt;
end
% 
% for i = 1:length(t_tot)
%     if(t_tot(i) < t(2))
%         t1(i)
% end

% % 
% % Plot position, velocity and acceleration for the trajectory in xyz
% % x
% subplot(3,3,1)
% plot(t,x, 'o')
% hold on
% plot(t_tot, pxplt, 'LineWidth', 2)
% legend('x points', 'x', 'Interpreter', 'latex')
% grid
% subplot(3,3,4)
% plot(t_tot, vxplt, 'LineWidth', 2)
% legend('$\dot{x}$', 'Interpreter', 'latex')
% grid
% subplot(3,3,7)
% plot(t_tot, axplt, 'LineWidth', 2)
% legend('$\ddot{x}$', 'Interpreter', 'latex')
% grid
% 
% % y
% subplot(3,3,2)
% plot(t,y, 'o')
% hold on
% plot(t_tot, pyplt, 'LineWidth', 2)
% legend('y points', 'y', 'Interpreter', 'latex')
% grid
% subplot(3,3,5)
% plot(t_tot, vyplt, 'LineWidth', 2)
% legend('$\dot{y}$', 'Interpreter', 'latex')
% grid
% subplot(3,3,8)
% plot(t_tot, ayplt, 'LineWidth', 2)
% legend('$\ddot{y}$', 'Interpreter', 'latex')
% grid
% 
% % z
% subplot(3,3,3)
% plot(t,z, 'o')
% hold on
% plot(t_tot, pzplt, 'LineWidth', 2)
% legend('z points', 'z ', 'Interpreter', 'latex')
% grid
% subplot(3,3,6)
% plot(t_tot, vzplt, 'LineWidth', 2)
% legend('$\dot{z}$ ', 'Interpreter', 'latex')
% grid
% subplot(3,3,9)
% plot(t_tot, azplt, 'LineWidth', 2)
% legend('$\ddot{z}$ ', 'Interpreter', 'latex')
% grid
% 
% % 3D plot of trajectory
% hold off
% figure
% plot3(pxplt,pyplt,pzplt)%, 'ro', 'LineWidth', 2, 'MarkerIndices', 1:50:length(pxplt))
% grid

% Piecewise plotting
plot(t_tot(t_tot<t(2)), pxplt(t_tot<t(2)), 'LineWidth', 2)
hold on
plot(t_tot(t_tot<t(3) & t_tot>t(2)), pxplt(t_tot<t(3) & t_tot>t(2)), 'LineWidth', 2)
plot(t_tot(t_tot<t(4) & t_tot>t(3)), pxplt(t_tot<t(4) & t_tot>t(3)), 'LineWidth', 2)
plot(t_tot(t_tot<t(5) & t_tot>t(4)), pxplt(t_tot<t(5) & t_tot>t(4)), 'LineWidth', 2)

% plot(t_tot, pxplt, 'LineWidth', 2)
legend('T1(t)', 'T2(t)', 'T3(t)', 'T4(t)',  'Interpreter', 'latex')
ylim([1.5 2.2])
grid

function [p,v,a] = trajGen(t,p,t_current)
% Function for calculating position, velociy and acceleration for
% a trajectory through 5 points.

% Preallocate matrix and vector sizes and init to zero
A = zeros(18, 18);
B = zeros(18,1);

% Filling necessary matrix columns:
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

% Right hand side vector (Position constraints, must pass through this
% point)
B(1) = p(1);
B(4) = p(2);
B(8) = p(3);
B(12) = p(4);
B(16) = p(5);

% Solve matrix for coefficients
coeff = A\B;

% Extract coefficients from coeff vector to abcd constants
a = coeff(1:5);
b = coeff(6:9);
c = coeff(10:13);
d = coeff(14:18);

if(t_current < t(2))
    p = F4(t_current)*a;
    v = F4Dot(t_current)*a;
    a = F4Dotdot(t_current)*a;
elseif(t_current < t(3))
    p = F3(t_current)*b;
    v = F3Dot(t_current)*b;
    a = F3Dotdot(t_current)*b;
elseif(t_current < t(4))
    p = F3(t_current)*c;
    v = F3Dot(t_current)*c;
    a = F3Dotdot(t_current)*c;
else
    p = F4(t_current)*d;
    v = F4Dot(t_current)*d;
    a = F4Dotdot(t_current)*d;
end
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