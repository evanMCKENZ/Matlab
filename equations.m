%{
Author: Evan McKenzie
Date: November 7, 2021
Class: EE 3160 Signals and Systems
%}

clc;

y0 = dsolve('0.01*D2y+0.123*Dy+0.2336*y==0','y(0)==2','t');

disp('Zero Input Response is');
disp(['y0=', char(y0)])

y1 = dsolve('0.01*D2y+0.123*Dy+0.2336*y-0.3==0','y(0)==2','t');

disp('Total Response is');
disp(['y1=', char(y1)])

%% Note that the total response for this system has two main terms with 
%% exponents, one multiplied by C1, and the other multiplied by C1 - (209/292)
%% (or C1 - 0.7157), and then a constant added onto the end. If we compare this 
%% to the hand calculated result, we can see that the real value of C2 is in
%% fact equal to -(C1 - 0.7157), and the value of the forced response is 1.28, or 375/292
%% We can extrapolate the zero-state equation from these two equations as we note the
%% difference in the terms of the second exponential value and the addition of the 
%% constant. So, the written equations would be...

%% Zero-Input : C1*e^(-2.32t) - (C1 - 2)*e^(-9.97t)

%% Zero-State : *e^(-9.97t) + 1.283

%% Total Response: C1*e^(-2.32t) - C2*e^(-9.97t) + 1.283