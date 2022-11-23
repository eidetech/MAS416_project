clc; close all;

filename = 'trajectory_3d_plot';

W_frame = 15;           % Final width of the frame [cm] of the plot in your document
H_frame = 5;            % Final height of the frame [cm] of the plot in your document

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(LW_thin)
LW = 1;             % Line width of lines on plot
else
LW = 2;             % Line width of lines on plot
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure;          % Handle for the figure
LLC_frame = [200,10];      % Position of lower left corner of the frame on the screen [cm]
fig.Units = 'inches';
fig.Position = [LLC_frame W_frame/2 H_frame]; %Specifying the width and height of the frame

% hold on

plot3(pxplt,pyplt, pzplt, '--', 'LineWidth', 2, 'MarkerIndices', 1:50:length(pxplt))
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