a = [4:1:8];
L = 2.^a;

fc = 3*L-2;
cc = 62 + 42*log2(L);
vs = fc./cc;

figure(1);
subplot(2,1,1);
plot(a, fc, a, cc);
subplot(2,1,2);
plot(a, vs);