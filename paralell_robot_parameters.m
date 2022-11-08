clc; close all; clear;
g = 9.81;

%dimmensions
T = 0.1;
PB = T+0.02; %pinbolt length
add_to_dim = 0.05;

%length beetween joints
L1 = 0.240; 
L2 = 0.800; 
L3 = 1.050;
L4 = 1.175;
L5 = 0.225;
L6 = 0.200;
L7 = 0.235;
L8 = 0.248;

% part 1
m1 = 750;
I1_x = 50;
I1_y = 50;
I1_z = 50;

% part 2
m2 = 250;
I2_x = 1;
I2_y = 20;
I2_z = 20;


% part 3
m3 = 150;
I3_x = 0.5;
I3_y = 8;
I3_z = 8;

% part 4
m4 = 500;
I4_x = 10;
I4_y = 10;
I4_z = 10;

% part 5
m5 = 50;
I5_x = 0.2;
I5_y = 1;
I5_z = 1;

% part 6
m6 = 150;
I6_x = 2;
I6_y = 3;
I6_z = 2;

% part 7
m7 = 200;
I7_x = 1;
I7_y = 18;
I7_z = 18;

% part 8
m8 = 100;
I8_x = 0.5;
I8_y = 2;
I8_z = 2;

%part 9
m9 = 50;
I9_x = 1;
I9_y = 1;
I9_z = 1;

%points to pass trough
P1x = 2;
P1y = 0.5;
P1z = 1.6;

P2x = 2;
P2y = -0.5;
P2z = 1.6;

P3x = 1.6;
P3y = 0.5;
P3z = 0.9;

P4x = 1.6;
P4y = 0;
P4z = 0.9;

P5x = P1x;
P5y = P1y;
P5z = P1z;







