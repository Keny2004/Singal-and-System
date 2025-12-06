fs = 8000;       
L = 80;          

dict = ['A','B','C','D','*','#','0','1','2','3','4','5','6','7','8','9'];
start_num = 1;
end_num = 16;
min_len = 1;
max_len = 25;
len = floor((max_len-min_len).*rand(1,1) + min_len);%隨機產生字串長度
r = floor((end_num-start_num).*rand(1,len) + start_num);%隨機產生字串內容
tk = dict(r)%字串

fprintf('-------------------------------------\n');
fprintf('隨機產生的字串: %s\n', tk);

%合成與播放
xx = dtmfdial(tk, fs);%呼叫把頻率合成的函式
soundsc(xx, fs);%播放合成的xx

%解碼
decoded = dtmfrun(xx, L, fs); 
fprintf('系統解碼結果: %s\n', decoded);

if strcmp(tk, decoded)
    fprintf('成功解碼\n');
else
    fprintf('解碼失敗\n');

end
fprintf('-------------------------------------\n');



