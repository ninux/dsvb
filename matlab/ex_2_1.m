clear all; close all;

fs = 5E3;
n = (0:1/fs:6/fs);
t = (0:1e-7:6/fs);

f1 = 2.1E3;
f2 = 2.9E3;
f3 = 7.1E3;
f4 = 7.9E3;

x1s = cos(2*pi*f1*n); x1 = cos(2*pi*f1*t);
x2s = cos(2*pi*f2*n); x2 = cos(2*pi*f2*t);
x3s = cos(2*pi*f3*n); x3 = cos(2*pi*f3*t);
x4s = cos(2*pi*f4*n); x4 = cos(2*pi*f4*t);

set(figure, 'Name', 'Aliasing'); hold on;
plot(n*1000, x1s, 'bx'); plot(t*1000, x1, 'b'); stem(n*1000, x1s, 'k');
plot(n*1000, x2s, 'rx'); plot(t*1000, x2, 'r');
plot(n*1000, x3s, 'gx'); plot(t*1000, x3, 'g');
plot(n*1000, x4s, 'yx'); plot(t*1000, x4, 'y');
title('Aliasing of 4 cosine signals');
axis([0 1.2 -1.1 1.1]);
grid; xlabel('t [ms]');