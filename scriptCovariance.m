
clc;
clearvars;
close all;
%Auto covariance of White Gaussian noise
%ww = randn(1000,1);
%[cov_ww,lags] = xcov(ww,10,'coeff');
%stem(lags,cov_ww)
%Cross-covariance of x and y measures the similarity between x and shifted
%(lagged) copies of y as a function of the lag. If x and y have different
%lengths, the function appends zeros at the end of the shorter vector so it
%has the same length as the other.
rng default
shft = 50;

s1 = rand(150,1);
s2 = circshift(s1,[shft 0]);% shift circulary with 0 time shifting
s = [s1 s2]; % construct a matrix of two channels

subplot(2,1,1)
plot(s1)
title('s_1')
subplot(2,1,2)
plot(s2)
title('s_2')
%hold on
%plot([shft shft],[0 1]
[c,lg] = xcov(s,'biased');

figure (2)
plot(lg,c)
legend('c_{s_1s_1}','c_{s_1s_2}','c_{s_2s_1}','c_{s_2s_2}')
%Change the normalization so that the cross-covariance and autocovariance 
%sequences are unity at zero lag. Plot each sequence in its own subplot.
[c,lg] = xcov(s,'coeff');
figure(3)
for a = 1:2
    for b = 1:2
        nm = 2*(a-1)+b;
        subplot(2,2,nm)
        plot(lg,c(:,nm))
        title(sprintf('c_{s_%ds_%d}',a,b))
        axis([-150 150 -0.2 1])
    end
end

