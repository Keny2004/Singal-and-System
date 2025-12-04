function xx = dtmfdial(keyNames,fs)
%DTMFDIAL  Create a signal vector of tones which will dial
%           a DTMF (Touch Tone) telephone system.
%
% usage:  xx = dtmfdial(keyNames,fs)
%  keyNames = vector of characters containing valid key names
%        fs = sampling frequency 8000
%   xx = signal vector that is the concatenation of DTMF tones.
%
dtmf.keys =['1','2','3','A';
            '4','5','6','B';
            '7','8','9','C';
            '*','0','#','D'];
dtmf.colTones = [1209,1336,1477,1633];
dtmf.rowTones = [697,770,852,941];

%播放亂數產生的keyNames
tt=0:1/fs:0.2; %每個字撥放0.2秒
sil=zeros(1,fix(fs/100*2)); %中間間隔0.02秒
% xx=zeros(1,length(tt)*length(keyNames));
xx2=0; %輸出音的暫存器
for kk=1:length(keyNames)
[ii,jj] = find(keyNames(kk)==dtmf.keys); %找出每個字在dtmf.key的位置
A=dtmf.colTones(jj); %高頻頻率
B=dtmf.rowTones(ii); %低頻頻率
amp=10; %輸出聲音大小

xx1=amp*(cos(2*pi*A*tt)+cos(2*pi*B*tt)); %將找出的兩個頻率合成
xx2=[xx2 sil xx1]; %將合成音與間隔音加到xx2陣列
end
xx=xx2(2:end); %將xx2存回xx，由於xx2第一個元素是0所以從第2元素開始






