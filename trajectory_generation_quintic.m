clc; clear all; close all;

% Position (xyz) and time vectors
px = [2 2 1.6 1.6 2];
py = [0.5 -0.5 0.5 0 0.5];
pz = [1.6 1.6 0.9 0.9 1.6];

pt = [px; py; pz]';

t = [0 0.7 1.5 2 3];

dt = 0.0001;
N = length(pt)-1;   % number of paths to generate and put together

v = 1;

vx = [0 -v/6 -v/6 v/6 0];
vy = [0 -v/10 v/20 -v*1.2 0];
vz = [0 -v/8 -v/8 v/8 0];

a = 0;

ax = [0 -a -a a 0];
ay = [0 -a a -a 0];
az = [0 -a -a a 0];

for i=1:N

    t0 = t(i);

    x0 = pt(i,  1);
    x1 = pt(i+1,1);
    y0 = pt(i,  2);
    y1 = pt(i+1,2);
    z0 = pt(i,  3);
    z1 = pt(i+1,3);

    v0_x = vx(i);
    v1_x = vx(i+1);

    v0_y = vy(i);
    v1_y = vy(i+1);

    v0_z = vz(i);
    v1_z = vz(i+1);

    a0_x = ax(i);
    a1_x = ax(i+1);

    a0_y = ay(i);
    a1_y = ay(i+1);

    a0_z = az(i);
    a1_z = az(i+1);

    t1 = t(i+1);

    [x, x_t, x_tt] = Quintic(t0, t1, dt, x0, x1, v0_x, v1_x, a0_x, a1_x);
    [y, y_t, y_tt] = Quintic(t0, t1, dt, y0, y1, v0_y, v1_y, a0_y, a1_y);
    [z, z_t, z_tt] = Quintic(t0, t1, dt, z0, z1, v0_z, v1_z, a0_z, a1_z);

    if i == 1 
        x_path_pos = x;
        x_path_vel = x_t;
        x_path_acc = x_tt;

        y_path_pos = y;
        y_path_vel = y_t;
        y_path_acc = y_tt;
        
        z_path_pos = z;
        z_path_vel = z_t;
        z_path_acc = z_tt;
        
        t_vect = (t0:dt:t1)';
        
    else
        x_path_pos = [x_path_pos; x];
        x_path_vel = [x_path_vel; x_t];
        x_path_acc = [x_path_acc; x_tt];

        y_path_pos = [y_path_pos; y];
        y_path_vel = [y_path_vel; y_t];
        y_path_acc = [y_path_acc; y_tt];
        
        z_path_pos = [z_path_pos; z];
        z_path_vel = [z_path_vel; z_t];
        z_path_acc = [z_path_acc; z_tt];
        
        t_vect = [t_vect; (t0:dt:t1)'];
    end
end

% plot3(x_path_pos,y_path_pos,z_path_pos)%, 'o', 'MarkerIndices', 1:1000:length(z_path_pos))
% xlabel("x")
% ylabel("y")
% zlabel("z")
% hold on
% plot3(px(1), py(1), pz(1), '*')
% plot3(px(2), py(2), pz(2), 'o')
% plot3(px(3), py(3), pz(3), '^')
% plot3(px(4), py(4), pz(4), '*')
% plot3(px(5), py(5), pz(5), 'o')
% grid
% 
% figure
% % Plot position, velocity and acceleration for the trajectory in xyz
% % x
% subplot(3,3,1)
% plot(t,px, 'o')
% hold on
% plot(t_vect, x_path_pos, 'LineWidth', 2)
% legend('x points', 'x', 'Interpreter', 'latex')
% grid
% subplot(3,3,4)
% plot(t_vect, x_path_vel, 'LineWidth', 2)
% legend('$\dot{x}$', 'Interpreter', 'latex')
% grid
% subplot(3,3,7)
% plot(t_vect, x_path_acc, 'LineWidth', 2)
% legend('$\ddot{x}$', 'Interpreter', 'latex')
% grid
% 
% % y
% subplot(3,3,2)
% plot(t,py, 'o')
% hold on
% plot(t_vect, y_path_pos, 'LineWidth', 2)
% legend('y points', 'y', 'Interpreter', 'latex')
% grid
% subplot(3,3,5)
% plot(t_vect, y_path_vel, 'LineWidth', 2)
% legend('$\dot{y}$', 'Interpreter', 'latex')
% grid
% subplot(3,3,8)
% plot(t_vect, y_path_acc, 'LineWidth', 2)
% legend('$\ddot{y}$', 'Interpreter', 'latex')
% grid
% 
% % z
% subplot(3,3,3)
% plot(t,pz, 'o')
% hold on
% plot(t_vect, z_path_pos, 'LineWidth', 2)
% legend('z points', 'z ', 'Interpreter', 'latex')
% grid
% subplot(3,3,6)
% plot(t_vect, z_path_vel, 'LineWidth', 2)
% legend('$\dot{z}$ ', 'Interpreter', 'latex')
% grid
% subplot(3,3,9)
% plot(t_vect, z_path_acc, 'LineWidth', 2)
% legend('$\ddot{z}$ ', 'Interpreter', 'latex')
% grid

% figure(4)
% set(4,'Units','Centimeter')
% set(4,'Position',[100 1 25 25]);
% xlabel('x [m]')
% ylabel('z [m]')
plot3(x_path_pos,y_path_pos, z_path_pos)
hold on
for i=1:100:length(t_vect)
    plot3(x_path_pos(i),y_path_pos(i), z_path_pos(i), 'ro')
    hold on

    
    axis equal
    box on
    grid on
    pause(0.01)
end