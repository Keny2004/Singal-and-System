function [nstart,nstop] = dtmfcut(xx,fs)
%DTMFCUT   find the DTMF tones within x[n]
%  usage:
%       [nstart,nstop] = dtmfcut(xx,fs)
%aaa
%   length of nstart = M = number of tones found
%      nstart is the set of STARTING indices
%      nstop is the set of ENDING indices
%    xx = input signal vector
%    fs = sampling frequency  
%
%  Looks for silence regions which must at least 10 millisecs long.
%  Also the tones must be longer than 100 msec

xx = xx(:)'/max(abs(xx));   %把xx加上絕對值，以更好判斷能量的大小，且除以最大值
Lx = length(xx);
Lz = round(0.01*fs);
setpoint = 0.02;      %若音量大於最大值的2%，則視為有聲音
xx = filter( ones(1,Lz)/Lz, 1, abs(xx) ); %讓靜音與按鍵音更容易分辨
%上面那行是使用低通濾波器，把高頻濾掉，僅保留聲音大小的趨勢

xx = diff(xx>setpoint); %找出靜音到按鍵音的變化點
jkl = find(xx~=0)'; %儲存所有變化點的index
%xx(jkl);
if xx(jkl(1))<0, jkl = [1;jkl];  end %如果第一個是下降點，插入1作為起始位置
if xx(jkl(end))>0, jkl = [jkl;Lx]; end %如果最後一個是上升點，插入-1作為結束位置
%jkl=[start1, stop1, start2, stop2, start3, stop3 ...]

%分割起始、結束點
indx = [];
while length(jkl)>1
	if jkl(2)>(jkl(1)+10*Lz) %時間必須大於100ms，避免把雜訊誤判成按鍵
		indx = [indx, jkl(1:2)];
%indx = [ start1  start2  start3 ... ;
%		stop1   stop2   stop3  ... ]
	end
	jkl(1:2) = []; %處理過的刪掉
end
nstart = indx(1,:);
nstop = indx(2,:);
