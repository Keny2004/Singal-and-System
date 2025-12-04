function  hh = dtmfdesign(fb, L, fs)
%DTMFDESIGN
%    hh = dtmfdesign(fb, L, fs)
%      returns a matrix (L by length(fb)) where each column contains
%      the impulse response of a BPF, one for each frequency in fb
%     fb = vector of center frequencies
%      L = length of FIR bandpass filters
%     fs = sampling freq
%
%   Each BPF must be scaled so that its frequency response has a
%    maximum magnitude equal to one.

%<=========================================FILL IN THE CODE HERE
n = 0:L-1;%建立0~L-1值的數列

for i = 1:length(fb)%每個頻率的長度
%b = 2/L 
hh(:, i) = (2/L) * cos(2*pi*fb(i)*n/fs); %用for迴圈來把每個濾波器的值填入每行
end

end
