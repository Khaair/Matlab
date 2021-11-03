function [xe,xo] = evenodd(t,x)
%This is a Matlab function for decomposing a real sequence into its even
%and odd components
%INPUTS:
% t: time index
%x: input sequence
%OUTPUTS:
%xe: even/ symmetric component
%xo:odd/ antisymmetric component

x_reverse = fliplr(x);% time reversal
xe = 0.5*(x + x_reverse); %even component
xo = 0.5*(x - x_reverse); %odd component
subplot(3,1,1);
stem(t,x);
title('Input signal x')
subplot(3,1,2); 
stem(t,xe);
title('Even part');
subplot(3,1,3);
stem(t,xo);
title('Odd part');
end
