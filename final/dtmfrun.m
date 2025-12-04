function keys_number = dtmfrun(xx,L,fs)
%DTMFRUN    keys = dtmfrun(xx,L,fs)
%    returns the list of key names found in xx.

    center_freqs = [697, 770, 852, 941, 1209, 1336, 1477, 1633]; 
    dtmf_keys = ['1','2','3','A';
                 '4','5','6','B';
                 '7','8','9','C';
                 '*','0','#','D'];

    hh = dtmfdesign( center_freqs,L,fs ); %設計每個頻率的濾波器
    [nstart,nstop] = dtmfcut(xx,fs);  %分割起始結束點
    keys_number = []; 

    for kk=1:length(nstart)
        x_seg = xx(nstart(kk):nstop(kk));
        
        scores = zeros(1, 8);
        for i = 1:8
            scores(i) = dtmfscore(x_seg, hh(:, i));
        end
        
        row_idx = find(scores(1:4));
        col_idx = find(scores(5:8));
        
        if length(row_idx) == 1 && length(col_idx) == 1
             decoded_key = dtmf_keys(row_idx, col_idx);
             keys_number = [keys_number, decoded_key];
        end
    end
end


