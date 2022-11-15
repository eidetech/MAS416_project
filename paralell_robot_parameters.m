clc; close all; clear;
g = 9.81;

%dimmensions
T = 0.1;
PB = T+0.02; %pinbolt length

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


R = 0.0; 
G = 0.8;
B = 1.0;
O = 0.2;

%Pid and Motor PARAMETERS:

I_max = 16;% Katrine gives value
K_m = [0.5, 1, 1.5];
gear_ratio = [20, 50, 100, 200];


KpOUTERALL = 100;
KiOUTERALL = 0;
KdOUTERALL = 0;

KpINNERALL = 100;
KdINNERALL = 0;
KiINNERALL = 0;


%Joint A
%thetha, outer loop
KpAt = 600;
KiAt = KiOUTERALL;
KdAt = KdOUTERALL;
%omega innner loop
KpAw = 600;
KiAw = KdINNERALL;
KdAw = KiINNERALL;

KmA = K_m(3); %Katrine gives value
g_ratioA = gear_ratio(4); %gear ratio



%Joint B
KpBt = KpOUTERALL;
KiBt = KiOUTERALL;
KdBt = KdOUTERALL;

%omega innner loop
KpBw = KpINNERALL;
KiBw = KdINNERALL;
KdBw = KiINNERALL;

KmB = K_m(3); %Katrine gives value
g_ratioB = gear_ratio(4);  %gear ratio

%Joint B2
KpB2t = KpOUTERALL;
KiB2t = KiOUTERALL;
KdB2t = KdOUTERALL;

%omega innner loop
KpB2w = KpINNERALL;
KiB2w = KdINNERALL;
KdB2w = KiINNERALL;

KmB2 = K_m(3); %Katrine gives value
g_ratioB2 = gear_ratio(4);  %gear ratio

%Joint D
KpDt= KpOUTERALL;
KiDt = KiOUTERALL;
KdDt = KdOUTERALL;

%omega innner loop
KpDw = KpINNERALL;
KiDw = KdINNERALL;
KdDw = KiINNERALL;

KmD = K_m(3); %Katrine gives value
g_ratioD = gear_ratio(4);  %gear ratio

%Joint E
KpEt = KpOUTERALL;
KiEt = KiOUTERALL;
KdEt = KdOUTERALL;

%omega innner loop
KpEw = KpINNERALL;
KiEw = KdINNERALL;
KdEw = KiINNERALL;

KmE =K_m(3); %Katrine gives value
g_ratioE = gear_ratio(4);  %gear ratio

%Joint H
KpHt = KpOUTERALL/10;
KiHt = KiOUTERALL;
KdHt = KdOUTERALL;

%omega innner loop
KpHw = KpINNERALL/10;
KiHw = KdINNERALL;
KdHw = KiINNERALL;

KmH = K_m(3); %Katrine gives value
g_ratioH = gear_ratio(4);  %gear ratio




