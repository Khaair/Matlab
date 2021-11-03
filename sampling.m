% Generate a continuous time cosine signal of 60 Hz.
clc;
close all;
clearvars;
f = 60; %Freq in Hz
tmin = -0.05; 
tmax = 0.05;
np = 40000;
t = linspace(tmin, tmax, np); %Generates np points, and spacing between points is (tmax-tmin)/np-1
x_c = cos(2*pi*f*t);
plot(t, x_c);
xlabel('t [s]');

% Saample x_c with a sampling frequency of 400 Hz
F = 1200;
T = 1/F;
nmin = ceil(tmin/T);
nmax = ceil(tmax/T);
n = nmin: nmax;
x1 = cos(2*pi*f*n*T);
hold on
plot(n*T,x1,'ro');
%hold off
% Saample x_c with a sampling frequency of 60 Hz
clear nmin, nmax,n, x1, T;
% Explain Aliasing: A high frequency cosine looks like a low frequency
% cosine
%figure (3);
F = 70;
T = 1/F;
x_c = cos(2*pi*10*t);
nmin = ceil(tmin/T);
nmax = ceil(tmax/T);
n = nmin: nmax;
x1 = cos(2*pi*f*n*T);
plot(t, x_c, 'v');
hold on
plot(n*T, x1,'ob');
hold off
