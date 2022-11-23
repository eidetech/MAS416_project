clc; close all;

filename = 'trajectory_3d_plot';

W_frame = 20
% W_frame = 36;           % Final width of the frame [cm] of the plot in your document
% H_frame = 7;            % Final height of the frame [cm] of the plot in your document
H_frame = 6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'centimeter';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame
fig.Renderer = 'painters'

plot3(pxplt,pyplt, pzplt, '-r', 'LineWidth', 1, 'MarkerIndices', 1:100:length(pxplt))
hold on
% plot3(pxplt,pyplt, pzplt, 'r*', 'LineWidth', 1, 'MarkerIndices', 1:100:length(pxplt))
legend('Trajectory', 'Interpreter', 'latex')
grid on;
xlabel('x [m]', 'interpreter', 'latex')
ylabel('y [m]', 'interpreter', 'latex')
zlabel('z [m]', 'interpreter', 'latex')
title('')
box on;
set(gca, 'FontName', font)
filename1 = append(filename, '.eps');
saveas(gcf,[output_path,filename1], 'epsc') % gcf = get current figure
close all