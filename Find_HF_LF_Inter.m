function [ HF_ST,HF_END,LF_ST,LF_END ] = Find_HF_LF_Inter( freq )
HF_ST_CHK=1;
HF_END_CHK=1;
LF_END_CHK=1;
i=1;
while(LF_END_CHK)
    if (freq(i)<0.4)&&(HF_ST_CHK)
        HF_ST_CHK=0;
        HF_ST=i;
    end
    
    if(freq(i)<0.15)&&(HF_END_CHK)
        HF_END_CHK=0;
        HF_END=i-1;
        LF_ST=i;
    end
    if(freq(i)<0.04)&&(LF_END_CHK)
        LF_END_CHK=0;
        LF_END=i-1;
        
    end
    i=i+1;
end

