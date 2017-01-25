function [ Feature_GSR_Mean,Feature_GSR_Mean_Dev,Feature_GSR_Dec_Mean,Feature_GSR_Dec_Ratio,Feature_GSR_Peaks] = GSR_Feature_Extraction( gsrsignal )

%%rejectsio 
%%Moving Window
MovingWindow_gsrsignal=zeros(length(gsrsignal),1);
for i=5:length(MovingWindow_gsrsignal)-4
    MovingWindow_gsrsignal(i,1)=(gsrsignal(i-4,1)+gsrsignal(i-3,1)+gsrsignal(i-2,1)+gsrsignal(i-1,1)+gsrsignal(i,1)+gsrsignal(i+1,1)+gsrsignal(i+2,1)+gsrsignal(i+3,1)+gsrsignal(i+4,1))/9;
end
MovingWindow_gsrsignal(1,1)=gsrsignal(1,1);
MovingWindow_gsrsignal(2,1)=gsrsignal(2,1);
MovingWindow_gsrsignal(3,1)=gsrsignal(3,1);
MovingWindow_gsrsignal(4,1)=gsrsignal(4,1);


MovingWindow_gsrsignal(length(gsrsignal),1)=gsrsignal(length(gsrsignal),1);
MovingWindow_gsrsignal(length(gsrsignal)-1,1)=gsrsignal(length(gsrsignal)-1,1);
MovingWindow_gsrsignal(length(gsrsignal)-2,1)=gsrsignal(length(gsrsignal)-2,1);
MovingWindow_gsrsignal(length(gsrsignal)-3,1)=gsrsignal(length(gsrsignal)-3,1);


Mov_GSR_Dev=zeros(length(MovingWindow_gsrsignal)-1,1);
Feature_GSR_Dec=0;
Feature_GSR_Dec_Count=0;

for i=1:length(MovingWindow_gsrsignal)-1;
    Mov_GSR_Dev(i,1)=MovingWindow_gsrsignal(i+1,1)-MovingWindow_gsrsignal(i,1);
    if Mov_GSR_Dev(i,1)<0
        Feature_GSR_Dec=Feature_GSR_Dec+Mov_GSR_Dev(i,1);
        Feature_GSR_Dec_Count=Feature_GSR_Dec_Count+1;
    end 
end


Feature_GSR_Peaks=0;
plot(MovingWindow_gsrsignal);
hold on;
for i=2:length(MovingWindow_gsrsignal)-1;
    if ((MovingWindow_gsrsignal(i,1)-MovingWindow_gsrsignal(i-1,1))<=0)&&((MovingWindow_gsrsignal(i+1,1)-MovingWindow_gsrsignal(i,1))>0)
        Feature_GSR_Peaks=Feature_GSR_Peaks+1;
        scatter(i,(MovingWindow_gsrsignal(i,1)));
    end 
end



Feature_GSR_Mean=mean(MovingWindow_gsrsignal);
Feature_GSR_Mean_Dev=mean(Mov_GSR_Dev);
Feature_GSR_Dec_Mean=mean(Feature_GSR_Dec);
Feature_GSR_Dec_Ratio=Feature_GSR_Dec_Count/length(Mov_GSR_Dev);
%Feature_GSR_Peaks;


end