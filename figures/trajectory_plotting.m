close all
clc

filename = 'x_trajectory_plot';

W_frame = 17;
H_frame = 6;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x1 = t_vect;
% y1 = x_path_pos;
% 
% x2 = t_vect;
% y2 = z_path_pos;

%%%%%%%%%%%%%%%%%%%%% Two plots, side by side (1x2) %%%%%%%%%%%%%%%%%%%%
% fig = figure;          % Handle for the figure
% LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
% fig.Units = 'centimeters';
% fig.Position = [LLC_frame W_frame H_frame]; %Specifying the width and height of the frame
% hold on
% 
% subplot(rows, cols, 1)
% plot(x1, y1, 'LineWidth',LW)
% grid on;
% legend('$x$', 'interpreter', 'latex')
% xlabel('$t$ [s]', 'interpreter', 'latex')
% ylabel('$x$ [m]', 'interpreter', 'latex')
% xlim([min(x1) max(x1)])
% ylim([min(y1)-bottom_margin max(y1)+top_margin])
% box on;
% set(gca, 'FontName', font)
% 
% subplot(rows, cols, 2)
% plot(x2, y2, 'r', 'LineWidth',LW)
% grid on
% legend('$z$', 'interpreter', 'latex')
% xlabel('$t$ [s]', 'interpreter', 'latex')
% ylabel('$z$ [m]', 'interpreter', 'latex')
% xlim([min(x1) max(x2)])
% ylim([min(y2)-bottom_margin max(y2)+top_margin])
% box on;
% set(gca, 'FontName', font)
% filename0 = append(filename, '.eps');
% saveas(gcf,[output_path,filename0], 'epsc') % gcf = get current figure
% close all

%%%%%%%%%%%%%%%%%%%%% Two separate plots, in two separate files %%%%%%%%%%%%%%%%%%%%
fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
hold on

plot(t_tot(t_tot<t(2)), pxplt(t_tot<t(2)), 'LineWidth', LW)
hold on
plot(t_tot(t_tot<t(3) & t_tot>t(2)), pxplt(t_tot<t(3) & t_tot>t(2)), 'LineWidth', LW)
plot(t_tot(t_tot<t(4) & t_tot>t(3)), pxplt(t_tot<t(4) & t_tot>t(3)), 'LineWidth', LW)
plot(t_tot(t_tot<t(5) & t_tot>t(4)), pxplt(t_tot<t(5) & t_tot>t(4)), 'LineWidth', LW)
plot(t, x, 'ko', 'LineWidth', LW)
% plot(t_tot, pxplt, 'LineWidth', 2)
legend('T1(t)', 'T2(t)', 'T3(t)', 'T4(t)', 'P1-5',  'Interpreter', 'latex')
grid on;
ylim([1.4 2.6])
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('$x$ [m]', 'interpreter', 'latex')
% xlim([min(x1) max(x1)])
% ylim([min(y1)-bottom_margin max(y1)+top_margin])
box on;
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all

% fig = figure;          % Handle for the figure
% LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
% fig.Units = 'centimeters';
% fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
% hold on
% 
% plot(x2, y2, 'r', 'LineWidth',LW)
% grid on
% legend('$z$', 'interpreter', 'latex')
% xlabel('$t$ [s]', 'interpreter', 'latex')
% ylabel('$z$ [m]', 'interpreter', 'latex')
% xlim([min(x1) max(x2)])
% ylim([min(y2)-bottom_margin max(y2)+top_margin])
% box on;
% set(gca, 'FontName', font)
% filename2 = append(filename, '_sep_2.eps');
% saveas(gcf,[output_path,filename2], 'epsc') % gcf = get current figure
% close all