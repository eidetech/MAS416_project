
%clc; 
close all;% clear; because of OUT to plot!
g = 9.81;




%Pid and Motor PARAMETERS:

I_max = 16;% Katrine gives value
K_m = [0.5, 1, 1.5];
K_m_cost = [1, 1.25, 1.5]; 
gear_ratio = [20, 50, 100, 200];
gear_ratio_cost = [1, 1.25, 1.5, 2.5];
powerMatrix = K_m.*gear_ratio';
costMatrix = K_m_cost.*gear_ratio_cost';


%Joint A
%thetha, outer loop, contropls theta
KpAt = 7000/200*2*1.5*2*2*2; % tuned with all other joints locked
KiAt = 0;
KdAt = 0;
%omega innner loop, controls theta dot, in a way
KpAw =3000/200; %Tuned with all other joints locked
KiAw = 0;
KdAw = 0;

KmA = K_m(2); %Må være motor 3
g_ratioA = gear_ratio(4); % Må være gir 4



%Joint B
KpBt = 15000/200*2*4*5; %OK 4*1.2s
KiBt = 0;
KdBt = 0;

%omega innner loop
KpBw = 9000/200*2; %Ok 4*1.2s
KiBw = 0;
KdBw = 0;

KmB = K_m(3); %Katrine gives value
g_ratioB = gear_ratio(3);  %gear ratio

%Joint B2
KpB2t = 30000/200*4;  % Virker greit 6e-4 rad i størst avvik
KiB2t = 0;
KdB2t = 0;

%omega innner loop
KpB2w = 3000/200;
KiB2w = 0;
KdB2w = 0;

KmB2 = K_m(2); %Ikke endret enda men no saturation
g_ratioB2 = gear_ratio(4);  %gear ratio

%Joint G
KpGt = 5*2*2*5*5; %old 300/200  Starts to ossilate easily. be careful
KiGt = 0;
KdGt = 0;

%omega innner loop
KpGw =  3*2;    % old 300/200;
KiGw = 0;
KdGw = 0;

KmG =K_m(3); %Katrine gives value
g_ratioG = gear_ratio(3);  %gear ratio



%Joint H
KpHt = 5000/200*2*10;
KiHt = 0;
KdHt =0;

%omega innner loop
KpHw = 2000/200*2; %Only values i could manage here. Look more at this later
KiHw = 0;
KdHw = 0;

KmH =K_m(1); %Katrine gives value
g_ratioH = gear_ratio(3);  %gear ratio



%Joint I
KpIt = 100/200*2*2*2*3*1.5*5*3;
KiIt = 0;
KdIt = 0;

%omega innner loop
KpIw = 7/200*2*2*2;
KiIw = 0;
KdIw = 0;

KmI =K_m(3); %
g_ratioI = gear_ratio(1);  %gear ratio






% INITIAL VALUE ANGLE I Read from ref data in hand of god model:
A0 = 1.8800355033;
B0 = -0.198177592218;
B20 = 0.024486078864;

G0 = -2.06664547582;
I0 = -2.0937842723459;
H0 = -0.3533098526406;








%dimmensions
T = 0.1;
PB = T+0.02; %pinbolt length


%Jeff on beams from motor
Jmotor = 0.002; %kgm^2


Jz_motorA = Jmotor*g_ratioA^2; % Jeff felt from the system after gearbox 
Jz_motorB = Jmotor*g_ratioB^2; % Jeff felt from the system after gearbox
Jz_motorB2 = Jmotor*g_ratioB2^2; % Jeff felt from the system after gearbox
Jz_motorG = Jmotor*g_ratioG^2; % Jeff felt from the system after gearbox
Jz_motorH = Jmotor*g_ratioH^2; % Jeff felt from the system after gearbox
Jz_motorI = Jmotor*g_ratioI^2; % Jeff felt from the system after gearbox

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





%READ FROM GRAPH
ErrorP1 = 0;

p2t = 1*1.2;
error1 = -1;%mm read from plot
error2 = -0.7;%mm read from plot 
error3 = -0.25;%mm read from plot
ErrorP2 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p3t = 2*1.2; % 
error1 = -1.2;%mm read from plot
error2 = -0.6;%mm read from plot 
error3 = 0.6;%mm read from plot
ErrorP3 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p4t = 3*1.2; % 3.6s
error1 = 0.4;%mm read from plot
error2 = 1;%mm read from plot 
error3 = 1.7;%mm read from plot
ErrorP4 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p5t =  4*1.2; %
error1 = 0.12;%mm read from plot
error2 = 0.02;%mm read from plot 
error3 = 0;%mm read from plot
ErrorP5 = sqrt(error1^2+error2^2+error3^2) %max 1mm


%clc; 
close all;% clear; because of OUT to plot!
g = 9.81;




%Pid and Motor PARAMETERS:

I_max = 16;% Katrine gives value
K_m = [0.5, 1, 1.5];
K_m_cost = [1, 1.25, 1.5]; 
gear_ratio = [20, 50, 100, 200];
gear_ratio_cost = [1, 1.25, 1.5, 2.5];
powerMatrix = K_m.*gear_ratio';
costMatrix = K_m_cost.*gear_ratio_cost';


%Joint A
%thetha, outer loop, contropls theta
KpAt = 7000/200*2*1.5*2*2*2; % tuned with all other joints locked
KiAt = 0;
KdAt = 0;
%omega innner loop, controls theta dot, in a way
KpAw =3000/200; %Tuned with all other joints locked
KiAw = 0;
KdAw = 0;

KmA = K_m(2); %Må være motor 3
g_ratioA = gear_ratio(4); % Må være gir 4



%Joint B
KpBt = 15000/200*2*4*5; %OK 4*1.2s
KiBt = 0;
KdBt = 0;

%omega innner loop
KpBw = 9000/200*2; %Ok 4*1.2s
KiBw = 0;
KdBw = 0;

KmB = K_m(3); %Katrine gives value
g_ratioB = gear_ratio(3);  %gear ratio

%Joint B2
KpB2t = 30000/200*4;  % Virker greit 6e-4 rad i størst avvik
KiB2t = 0;
KdB2t = 0;

%omega innner loop
KpB2w = 3000/200;
KiB2w = 0;
KdB2w = 0;

KmB2 = K_m(2); %Ikke endret enda men no saturation
g_ratioB2 = gear_ratio(4);  %gear ratio

%Joint G
KpGt = 5*2*2*5*5; %old 300/200  Starts to ossilate easily. be careful
KiGt = 0;
KdGt = 0;

%omega innner loop
KpGw =  3*2;    % old 300/200;
KiGw = 0;
KdGw = 0;

KmG =K_m(3); %Katrine gives value
g_ratioG = gear_ratio(3);  %gear ratio



%Joint H
KpHt = 5000/200*2*10;
KiHt = 0;
KdHt =0;

%omega innner loop
KpHw = 2000/200*2; %Only values i could manage here. Look more at this later
KiHw = 0;
KdHw = 0;

KmH =K_m(1); %Katrine gives value
g_ratioH = gear_ratio(3);  %gear ratio



%Joint I
KpIt = 100/200*2*2*2*3*1.5*5*3;
KiIt = 0;
KdIt = 0;

%omega innner loop
KpIw = 7/200*2*2*2;
KiIw = 0;
KdIw = 0;

KmI =K_m(3); %
g_ratioI = gear_ratio(1);  %gear ratio






% INITIAL VALUE ANGLE I Read from ref data in hand of god model:
A0 = 1.8800355033;
B0 = -0.198177592218;
B20 = 0.024486078864;

G0 = -2.06664547582;
I0 = -2.0937842723459;
H0 = -0.3533098526406;








%dimmensions
T = 0.1;
PB = T+0.02; %pinbolt length


%Jeff on beams from motor
Jmotor = 0.002; %kgm^2


Jz_motorA = Jmotor*g_ratioA^2; % Jeff felt from the system after gearbox 
Jz_motorB = Jmotor*g_ratioB^2; % Jeff felt from the system after gearbox
Jz_motorB2 = Jmotor*g_ratioB2^2; % Jeff felt from the system after gearbox
Jz_motorG = Jmotor*g_ratioG^2; % Jeff felt from the system after gearbox
Jz_motorH = Jmotor*g_ratioH^2; % Jeff felt from the system after gearbox
Jz_motorI = Jmotor*g_ratioI^2; % Jeff felt from the system after gearbox

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





%READ FROM GRAPH
ErrorP1 = 0;

p2t = 1*1.2;
error1 = -1;%mm read from plot
error2 = -0.7;%mm read from plot 
error3 = -0.25;%mm read from plot
ErrorP2 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p3t = 2*1.2; % 
error1 = -1.2;%mm read from plot
error2 = -0.6;%mm read from plot 
error3 = 0.6;%mm read from plot
ErrorP3 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p4t = 3*1.2; % 3.6s
error1 = 0.4;%mm read from plot
error2 = 1;%mm read from plot 
error3 = 1.7;%mm read from plot
ErrorP4 = sqrt(error1^2+error2^2+error3^2) %max 3mm

p5t =  4*1.2; %
error1 = 0.12;%mm read from plot
error2 = 0.02;%mm read from plot 
error3 = 0;%mm read from plot
ErrorP5 = sqrt(error1^2+error2^2+error3^2) %max 1mm




>>>>>>> 00a30d7637ffb77f347ed2ae2ff9c63f81d4809c
