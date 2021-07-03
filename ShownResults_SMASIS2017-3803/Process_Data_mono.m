 
clear
clc
close all

filename = '030g_5cycles_monofilament_no_header.csv';
num030m = csvread(filename);
time_030m_raw = num030m(:,1);
disp_030m_raw = num030m(:,2); %this is in mm
rot_030m_raw = disp_030m_raw/3*180/pi;
temp_amb_030m_raw = num030m(:,3);
temp_030m_raw = num030m(:,4);
%This gets all the data on 0.01 dt
time_030m = 0:0.01:max(time_030m_raw);
disp_030m = interp1(time_030m_raw,disp_030m_raw,time_030m);
rot_030m  = interp1(time_030m_raw,rot_030m_raw, time_030m);
temp_030m = interp1(time_030m_raw,temp_030m_raw,time_030m);
%This reshapes the data into rows of 10 so I then can average each row to
%do a moving average every 0.1 s
clip_030m = 1+sum(time_030m*10>floor(max(time_030m)*10));
time_030m_mat = reshape(time_030m(1:end-clip_030m),10,length(time_030m(1:end-clip_030m))/10)';
disp_030m_mat = reshape(disp_030m(1:end-clip_030m),10,length(disp_030m(1:end-clip_030m))/10)';
rot_030m_mat  = reshape(rot_030m(1:end-clip_030m),10,length(rot_030m(1:end-clip_030m))/10)';
temp_030m_mat = reshape(temp_030m(1:end-clip_030m),10,length(temp_030m(1:end-clip_030m))/10)';
%This gets the averages for each 0.1 seconds using the previous 10 0.01 dts
time_030m_av = time_030m_mat(:,1);%the measurement at each instant will be the average over the previous 0.01 s
disp_030m_av = [disp_030m(1,1);mean(disp_030m_mat')'];disp_030m_av = disp_030m_av(1:end-1);
rot_030m_av  = [rot_030m(1,1) ;mean(rot_030m_mat')'] ;rot_030m_av = rot_030m_av(1:end-1);
temp_030m_av = [temp_030m(1,1);mean(temp_030m_mat')'];temp_030m_av = temp_030m_av(1:end-1);


filename = '100g_5cycles_monofilament_no_header.csv';
num100m = csvread(filename);
time_100m_raw = num100m(:,1);
disp_100m_raw = num100m(:,2); %this is in mm
rot_100m_raw = disp_100m_raw/3*180/pi;
temp_amb_100m_raw = num100m(:,3);
temp_100m_raw = num100m(:,4);
%This gets all the data on 0.01 dt
time_100m = 0:0.01:max(time_100m_raw);
disp_100m = interp1(time_100m_raw,disp_100m_raw,time_100m);
rot_100m  = interp1(time_100m_raw,rot_100m_raw, time_100m);
temp_100m = interp1(time_100m_raw,temp_100m_raw,time_100m);
%This reshapes the data into rows of 10 so I then can average each row to
%do a moving aberage every 0.1 s
%Need to clip the last 0.03 s to get the right number of elements
clip_100m = 1+sum(time_100m*10>floor(max(time_100m)*10));
time_100m_mat = reshape(time_100m(1:end-clip_100m),10,length(time_100m(1:end-clip_100m))/10)';
disp_100m_mat = reshape(disp_100m(1:end-clip_100m),10,length(disp_100m(1:end-clip_100m))/10)';
rot_100m_mat  = reshape(rot_100m(1:end-clip_100m),10,length(rot_100m(1:end-clip_100m))/10)';
temp_100m_mat = reshape(temp_100m(1:end-clip_100m),10,length(temp_100m(1:end-clip_100m))/10)';
%This gets the averages for each 0.1 seconds using the previous 10 0.01 dts
time_100m_av = time_100m_mat(:,1);%the measurement at each instant will be the average over the previous 0.01 s
disp_100m_av = [disp_100m(1,1);mean(disp_100m_mat')'];disp_100m_av = disp_100m_av(1:end-1);
rot_100m_av  = [rot_100m(1,1) ;mean(rot_100m_mat')'] ;rot_100m_av = rot_100m_av(1:end-1);
temp_100m_av = [temp_100m(1,1);mean(temp_100m_mat')'];temp_100m_av = temp_100m_av(1:end-1);


fig_rot_and_temp_v_t = figure;
subplot(2,1,1)
[AX1,H1,H2] = plotyy(time_030m_av,rot_030m_av-rot_030m_av(1),time_030m_av,temp_030m_av-temp_030m_av(1)); hold on
xlabel(AX1(1),'Time (s)')
ylabel(AX1(2),'Internal temperature change (^\circC)')
ylabel(AX1(1),'Rotation (degrees)')
ylim(AX1(1),[0 35])
ylim(AX1(2),[0 120])
AX1(1).YTick = [0:5:35];
AX1(2).YTick = [0:20:120];
AX1(1).XLim = [0 2600];
AX1(2).XLim = [0 2600];
title('0.883 N-mm Preload Torque')
%legend('Rotation','Temperature','Location','Northwest')
grid on 

subplot(2,1,2)
[AX1,H1,H2] = plotyy(time_100m_av,rot_100m_av-rot_100m_av(1),time_100m_av,temp_100m_av-temp_100m_av(1)); hold on
xlabel(AX1(1),'Time (s)')
ylabel(AX1(2),'Internal temperature change (^\circC)')
ylabel(AX1(1),'Rotation (degrees)')
ylim(AX1(1),[-10 0])
ylim(AX1(2),[0 120])
AX1(1).YTick = [-10:2:0];
AX1(2).YTick = [0:20:120];
AX1(1).XLim = [0 2600];
AX1(2).XLim = [0 2600];
title('2.94 N-mm Preload Torque')
legend('Rotation','Temperature','Location','Northeast')
grid on 

%saveas(fig_rot_and_temp_v_t,'TIMEPLOT_030100M','tif')


fig_rot_v_temp = figure
para = [ 0 0.4470 0.7410]
plot(temp_030m_av-temp_030m_av(1),rot_030m_av-rot_030m_av(1),'Color',para,'LineStyle','--'); hold on
plot(temp_100m_av-temp_100m_av(1),rot_100m_av-rot_100m_av(1),'Color',para,'LineStyle','-'); hold on
xlabel('Internal temperature change (^\circC)')
ylabel('Rotation (degrees)')
legend('2.94 N-mm Preload Torque','8.83 N-mm Preload Torque','Location','Northwest')
grid on
ylim([-10 35])
saveas(fig_rot_v_temp,'ROT_V_TEMP_MONO','tif')


% 

