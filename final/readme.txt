main
├─1.dtmfdial:建立一個信號向量(DTMF(dual tone multiple frequency) )
└─2.dtmfrun:回傳從dtmfdial產生的信號向量找到的key names(0~9,A~D,*,#)
    ├─1.dtmfdesign:產生一個L*8矩陣，為8組FIR band pass filter，(L代表FIR band pass filter的長度，8代表所設定的8組中心頻率)
    ├─2.dtmfcut:可以自動分辨出有多少組電話按鍵音，並找到tone burst的開頭與結尾索引值
    └─3.dtmfscore:根據filter output的最大振幅值回傳分數是一組編碼的形式，參考答案是一組1*8的向量1~4為ROW(列),5~6為COL(行)

dtmfscore output(參考答案) Example:
[  0   1   2   3    4    5    6    7]
[697,770,852,941,1209,1336,1477,1633]

	1209	1336	1477	1633
697	'1'	'2'	'3'	'A'
770	'4'	'5'	'6'	'B'
852	'7'	'8'	'9'	'C'
941	'*'	'0'	'#'	'D'

[  0  1  2  3  4  5  6  7]
[  0  0  1  0  0  0  1  0]
代表抓到852,1477頻率也就是按鍵'9'




main:提供
├─1.dtmfdial:提供
└─2.dtmfrun:學生填入code
    ├─1.dtmfdesign:學生填入code
    ├─2.dtmfcut:提供
    └─3.dtmfscore:學生填入code

exercise：上課討論一下如何做DTMFencoding
