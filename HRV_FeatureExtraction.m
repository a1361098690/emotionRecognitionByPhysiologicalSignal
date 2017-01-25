function [Feature_SDNN,Feature_RMSSD,Feature_SDSD,Feature_NN20,Feature_pNN20,Feature_NN50,Feature_pNN50,ratio] = HRV_FeatureExtraction(RRinterval,fs)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

successive_dif=zeros(length(RRinterval)-1,1);
 
Feature_NN50=0;
Feature_NN20=0;
 
for i=1:length(RRinterval)-1
    successive_dif(i,1)=RRinterval(i+1)-RRinterval(i);
    
    if ((fs*0.05)<abs(successive_dif(i,1)))
        Feature_NN50=Feature_NN50+1;
    end
    if ((fs*0.02)<abs(successive_dif(i,1)))
        Feature_NN20=Feature_NN20+1;
    end
   
end
 
 
%%HRV Feature Parameter Extraction
 
Feature_SDNN=std(RRinterval);
Feature_RMSSD=rms(successive_dif);
Feature_SDSD=std(successive_dif);
%Feature_NN50;
%Feature_NN20;
Feature_pNN50=Feature_NN50/length(successive_dif);
Feature_pNN20=Feature_NN20/length(successive_dif);
 
%-------------------------------------------------------------------------
 
 
figure;
wname = 'morl'; scales = 1:1:3000; coefs = cwt(RRinterval,scales,wname,'lvlabs');

freq = scal2frq(scales,wname,1/fs);
coefsSquared = abs(coefs).^2;
graph1D=sum(coefsSquared,2);

figure;
plot(freq,graph1D);title('wavelet transform result');
[HF_ST,HF_END,LF_ST,LF_END]=Find_HF_LF_Inter(freq);
hf=polyarea(freq(HF_ST:HF_END),graph1D(HF_ST:HF_END)');
lf=polyarea(freq(LF_ST:LF_END),graph1D(LF_ST:LF_END)');
ratio=lf/hf;

end



