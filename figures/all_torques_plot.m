clc; close all;

filename = 'all_torques_plot';

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

plot(torques{1}.Values, 'LineWidth', LW)
hold on
plot(torques{2}.Values, 'LineWidth', LW)
plot(torques{3}.Values, 'LineWidth', LW)
plot(torques{4}.Values, '-s', 'MarkerIndices',1:300:length(torques{4}.Values.Data), 'LineWidth', LW)
plot(torques{5}.Values, '--', 'LineWidth', LW)
plot(torques{6}.Values, '-o', 'MarkerIndices',1:300:length(torques{4}.Values.Data), 'LineWidth', LW)
legend('$M_{JA}$', '$M_{JB}$', '$M_{JB2}$', '$M_{JH}$', '$M_{JI}$', '$M_{JG}$', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[Nm]', 'interpreter', 'latex')
title('')
box on;
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all