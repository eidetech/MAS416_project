

plot(helo3{1}.Values, 'LineWidth', 2)
hold on
plot(helo3{2}.Values, 'LineWidth', 2)
plot(helo3{3}.Values, 'LineWidth', 2)
legend('x', 'y', 'z', 'Interpreter', 'latex')
grid on;
xlabel('$t$ [s]', 'interpreter', 'latex')
ylabel('[m]', 'interpreter', 'latex')
title('')