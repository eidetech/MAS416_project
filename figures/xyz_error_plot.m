clc; close all;

filename = 'xyz_error_plot_4s';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
hold on

plot(xyz_error_4s{1}.Values, 'LineWidth', LW)
hold on
plot(xyz_error_4s{2}.Values, 'LineWidth', LW)
plot(xyz_error_4s{3}.Values, 'LineWidth', LW)
legend('$x_{error}$', '$y_{error}$', '$z_{error}$', 'Interpreter', 'latex')
% legend('$e_x$', '$e_y$', '$e_z$', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[m]', 'interpreter', 'latex')
ylim([-6.3*10^-3 6.7*10^-3])
title('')
box on;
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all


filename = 'xyz_error_plot_4_8s';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'centimeters';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
hold on

plot(xyz_error_4_8s{1}.Values, 'LineWidth', LW)
hold on
plot(xyz_error_4_8s{2}.Values, 'LineWidth', LW)
plot(xyz_error_4_8s{3}.Values, 'LineWidth', LW)
legend('$x_{error}$', '$y_{error}$', '$z_{error}$', 'Interpreter', 'latex')
% legend('$e_x$', '$e_y$', '$e_z$', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[m]', 'interpreter', 'latex')
ylim([-6.3*10^-3 6.7*10^-3])
title('')
box on;
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all