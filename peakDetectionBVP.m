function [ RRinterval ] = peakDetectionBVP( bvpsignal )
% use for extract RR interval
% use => [RRinterval]=peakDetectionBVP(bvpsignal)
MovingWindow=bvpsignal;
PeakLocation=zeros(ceil(length(MovingWindow)/2),1);
PeakTimeVariance=zeros(ceil(length(MovingWindow)/2),1);
Count=1;
PeakCount=0;

%%Moving Window
MovingWindow_Test=zeros(length(MovingWindow),1);
for i=4:length(MovingWindow)-3
    MovingWindow_Test(i,1)=(MovingWindow(i-3,1)+MovingWindow(i-2,1)+MovingWindow(i-1,1)+MovingWindow(i,1)+MovingWindow(i+1,1)+MovingWindow(i+2,1)+MovingWindow(i+3,1))/7;
end
MovingWindow_Test(1,1)=MovingWindow(1,1);
MovingWindow_Test(2,1)=MovingWindow(2,1);
MovingWindow_Test(3,1)=MovingWindow(3,1);
MovingWindow_Test(length(MovingWindow),1)=MovingWindow(length(MovingWindow),1);
MovingWindow_Test(length(MovingWindow)-1,1)=MovingWindow(length(MovingWindow)-1,1);
MovingWindow_Test(length(MovingWindow)-2,1)=MovingWindow(length(MovingWindow)-2,1);

figure;
plot(MovingWindow_Test);
hold on

%%Peak Detection
for i=3:length(MovingWindow)-2
    if (MovingWindow_Test(i-2,1)<MovingWindow_Test(i-1,1))&&(MovingWindow_Test(i-1,1)<MovingWindow_Test(i,1))&&(MovingWindow_Test(i,1)>MovingWindow_Test(i+1,1))&&(MovingWindow_Test(i+1,1)>MovingWindow_Test(i+2,1))
        PeakLocation(Count,1)=i;
        scatter(i,MovingWindow_Test(i));
        hold on;
        Count=Count+1;
    end
end
PeakCount=Count-1;


%%RR-interval Extraction
for i=2:PeakCount
    PeakTimeVariance(i-1,1)=PeakLocation(i,1)-PeakLocation(i-1,1);
end


RRinterval=PeakTimeVariance(1:PeakCount-1);



end

