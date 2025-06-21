clc; clear;close all;
Fs=44100;

% Generate 1 second of white noise
rand('state',sum(100 * clock));
noise = randn(1, Fs);
noise = noise / max(abs(noise));

% BAND PASS FILTER
fc=1000;                % Central Frequency
f1=fc/2^0.5;
f2=fc*2^0.5;
w1=2*pi*f1/Fs;
w2=2*pi*f2/Fs;
wc=2*pi*fc/Fs;

ncof=200;               % number of coeficients,
if rem(ncof, 2)         % must be even 
    ncof=ncof+1;
end
n=0:ncof;
M=length(n)-1;          % filter order
% Filter
h=sin(w2*(n-(M/2)))./((n-(M/2))*pi)-sin(w1*(n-(M/2)))./((n-(M/2))*pi);
h(M/2+1)=(w2-w1)/pi;

% Filter white noise
filternoise = fftconv(noise,h);
% Extract IR from filtered noise
hnew = fftdec(filternoise,noise);

% White noise spectrum
nf=4096; %number of point in DTFT
Yw = fft(noise,nf);
fw = Fs/2*linspace(0,1,nf/2+1);
% Filtered white noise spectrum
Yf = fft(filternoise,nf);

figure
plot(fw, abs(Yw(1:nf/2+1)));
title('White noise spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([500 10000]);

figure
plot(fw, abs(Yf(1:nf/2+1)));
title('Filtered white noise spectrum');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([100 10000]);

figure
plot(0:length(h)-1, h);
title('Original IR - BandPass Filter');
xlabel('Samples');
ylabel('Amplitude');
xlim([0 length(h)]);

figure
plot(0:length(hnew)-1, hnew);
title('Extracted IR');
xlabel('Samples');
ylabel('Amplitude');
xlim([0 length(h)]);


function [ h ] = fftdec( out,in )
no = length(out);
ni = length(in);
nfft = 2^nextpow2(no+ni-1);
ozp = [out, zeros(1,nfft-no)];
izp = [in, zeros(1,nfft-ni)];
O = fft(ozp);
I = fft(izp);

Y = O ./ I;
h = real(ifft(Y));
end

function [ y ] = fftconv( x, h )

nx = length(x);
nh = length(h);
nfft = 2^nextpow2(nx+nh-1);
xzp = [x, zeros(1,nfft-nx)];
hzp = [h, zeros(1,nfft-nh)];
X = fft(xzp);
H = fft(hzp);

Y = H .* X;
y = real(ifft(Y));
end



