clear all
clc;
close all;

% fs=20;4drflio89u89oikjmn n x
Person=CreateEmotionDataStruct();

for day=1:20
    close all;
    [bvpsignal_1, gsrsignal_1]=loadMITdb(day,1);
    [bvpsignal_2, gsrsignal_2]=loadMITdb(day,2);
    [bvpsignal_3, gsrsignal_3]=loadMITdb(day,3);
    [bvpsignal_4, gsrsignal_4]=loadMITdb(day,4);
    [bvpsignal_5, gsrsignal_5]=loadMITdb(day,5);
    [bvpsignal_6, gsrsignal_6]=loadMITdb(day,6);
    [bvpsignal_7, gsrsignal_7]=loadMITdb(day,7);
    [bvpsignal_8, gsrsignal_8]=loadMITdb(day,8);


    RRinterval_1=peakDetectionBVP(bvpsignal_1);
    RRinterval_2=peakDetectionBVP(bvpsignal_2);
    RRinterval_3=peakDetectionBVP(bvpsignal_3);
    RRinterval_4=peakDetectionBVP(bvpsignal_4);
    RRinterval_5=peakDetectionBVP(bvpsignal_5);
    RRinterval_6=peakDetectionBVP(bvpsignal_6);
    RRinterval_7=peakDetectionBVP(bvpsignal_7);
    RRinterval_8=peakDetectionBVP(bvpsignal_8);



    %figure;
    %plot(RRinterval_1,'r');
    %hold on;
    %plot(RRinterval_2,'b');
    emot=1;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_no_emot_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_1,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_1); 

    emot=2;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_angry_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_2,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_2);
    emot=3;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_hate_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_3,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_3);
    emot=4;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_grief_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_4,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_4);
    emot=5;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_plove_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_5,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_5);
    emot=6;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_rlove_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_6,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_6);
    emot=7;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_joy_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_7,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_7);
    emot=8;
    n=(20*(emot-1))+day;
    Person(n).Name=strcat('mitdb_reverence_day',num2str(day));
    [Person(n).Feature_SDNN,Person(n).Feature_RMSSD,Person(n).Feature_SDSD,Person(n).Feature_NN20,Person(n).Feature_pNN20,Person(n).Feature_NN50,Person(n).Feature_pNN50,Person(n).Feature_LFHF_Ratio] = HRV_FeatureExtraction(RRinterval_8,fs);
    [Person(n).Feature_GSR_Mean,Person(n).Feature_GSR_Mean_Dev,Person(n).Feature_GSR_Dec_Mean,Person(n).Feature_GSR_Dec_Ratio,Person(n).Feature_GSR_Peaks]=GSR_Feature_Extraction(gsrsignal_8);
end