function [bvpsignal,gsrsignal] = loadMITdb( day, emotion)
%   this is function for load mit emotional data
%   use => [bvpsignal,gsrsignal]=loadMITdb(day,emotion)
%   day is int
%   No Emotion=0, Anger=1, Hate=2, Grief=3, P-Love=4, R-Love=5, Joy=6,
%   Reverence=7
 
pre='day';
day=num2str(day);

day=strcat(pre,day);
clear pre;
%Data load ----------------------------------------------
data=load(day,'-mat');
%----------------------------------------------------------
data=data.(day);

%Selection of signal--------------------------------------

bvpsignal=data(:,emotion+8);
gsrsignal=data(:,emotion+16);

figure;plot(bvpsignal);title('BVP signal');
figure;plot(gsrsignal);title('GSR signal')

%---------------------------------------------------------

