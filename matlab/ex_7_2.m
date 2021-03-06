% clean up environment
clear all; close all;

%%
% definitions and parameters
fc = 0.35;
b_tp = (sin(2*pi*fc*[-2:2]))./(pi*[-2:2]);  % Filter Impulse Response
b_tp(3) = 2*fc;

set(figure, 'Name', 'Exercise 7.2/1 - handmade');
stem(b_tp);

b_tp_2 = fir1(4, 0.7, rectwin(5), 'noscale');
set(figure, 'Name', 'Exercise 7.2/1 - fir1 made');
stem(b_tp_2);

%%
fc = 0.35;
% Low-Pass Filter Impulse Response for fc
b_tp_1 = (sin(2*pi*fc*[-2:2]))./(pi*[-2:2]);
b_tp_1(3) = 2*fc;
% Low-Pass Filter Impulse Response for pi
b_tp_2 = [0 0 1 0 0];
% Calculate the High-Pass
b_hp = b_tp_2 - b_tp_1;

set(figure, 'Name', 'Exercise 7.2/3 - Highpass');
stem(b_hp);