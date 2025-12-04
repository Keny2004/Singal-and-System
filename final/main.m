fs = 8000;       
L = 80;          
string = 10;   %隨機產生10個按鍵

%隨機產生字串
char = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','*','#'];
randomnum = randi(length(char), 1,string); %randomnum陣列內容為char的index
tk = char(randomnum); %將index轉為char陣列字元，並存到tk

fprintf('\n');
fprintf('隨機產生的字串: %s\n', tk);

%合成與播放
xx = dtmfdial(tk, fs);
soundsc(xx, fs);

%解碼
decoded = dtmfrun(xx, L, fs); 
fprintf('系統解碼結果: %s\n', decoded);

if strcmp(tk, decoded)
    fprintf('Result = Correct\n');
else
    fprintf('Result = Error\n');

end

