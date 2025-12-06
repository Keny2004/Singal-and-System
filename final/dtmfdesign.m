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

%sin²+cos²=1 因sin和cos 僅相位不同，面積相同，故cos²=1/2
%原理是，濾波器會提供一個特定頻率的cos波，並將振幅正規化
%若輸入訊號是相同頻率，則相乘後正正得正，負負得正，正負半週相加後，會有很大的值
%若輸入訊號相位（頻率）不同，則正負半週相抵消，其值為0
%每個頻率的矩陣是L*1，L的長度中，每個元素是每1/fs秒時對特定頻率的cos波取樣的值

end

end
