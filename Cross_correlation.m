clc;
clearvars;
close all;

x =[3 11 7 0 -1 4 2];
nx = -3:3;
lag = 3;
[y,ny] = sigshift(x,nx,lag);
%y=x[n-2]
w = randn(1,length(y));
nw=ny;
[y,ny] = sigadd(y,ny, w,nw);
%y=x[n-2]+w[n]
[x,~] = sigfold(x,nx);
rxy = conv(y,x);
nrxyb = nx(1)+ny(1);
nrxyend = nx(length(x))+ny(length(y));
nrxy = nrxyb:nrxyend;
%[~, ind]= max(rxy);
%lagMax = nrxy(ind);
%subplot(1,1,1);
subplot(3,1,1);
stem(nx,x);
title('X');
subplot(3,1,2);
stem(ny,y);
title('Y');
subplot(3,1,3);
stem(nrxy, rxy);
axis([-5 10 -50 300]);
xlabel('Lag variable:l');
ylabel('rxy');
title('Cross correlation of noise sequence with a given input');

%Here is another example of cross correlation
    %load sensorData s1 s2
    %[acor,lag] = xcorr(s2,s1);
    %[~,I] = max(abs(acor));
    %timeDiff = lag(I)         % sensor 2 leads sensor 1 by 350 samples
    %subplot(311); plot(s1); title('s1');
    %subplot(312); plot(s2); title('s2');
    %subplot(313); plot(lag,acor);
    %title('Cross-correlation between s1 and s2')
