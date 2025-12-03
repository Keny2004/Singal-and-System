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
hh = zeros(L, length(fb));
n = 0:L-1;

for i = 1:length(fb)
% from PPT，b = 2/L 
hh(:, i) = (2/L) * cos(2*pi*fb(i)*n/fs); 
end
end