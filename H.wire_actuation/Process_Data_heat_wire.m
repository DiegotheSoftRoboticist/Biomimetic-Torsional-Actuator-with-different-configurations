 
clear
clc
close all

filename = 'heating_wire_200g_2cycles_T1_no_header.csv';
num200T1 = csvread(filename);
time_200T1_raw = num200T1(:,1);
disp_200T1_raw = num200T1(:,2); %this is in mm
rot_200T1_raw = disp_200T1_raw/3*180/pi;
temp_amb_200T1_raw = num200T1(:,3);
temp_200T1_raw = num200T1(:,4);
%This gets all the data on 0.01 dt
time_200T1 = 0:0.01:max(time_200T1_raw);
disp_200T1 = interp1(time_200T1_raw,disp_200T1_raw,time_200T1);
rot_200T1  = interp1(time_200T1_raw,rot_200T1_raw, time_200T1);
temp_200T1 = interp1(time_200T1_raw,temp_200T1_raw,time_200T1);
%This reshapes the data into rows of 10 so I then can average each row to
%do a moving average every 0.1 s
clip_200T1 = 1+sum(time_200T1*10>floor(max(time_200T1)*10));
time_200T1_mat = reshape(time_200T1(1:end-clip_200T1),10,length(time_200T1(1:end-clip_200T1))/10)';
disp_200T1_mat = reshape(disp_200T1(1:end-clip_200T1),10,length(disp_200T1(1:end-clip_200T1))/10)';
rot_200T1_mat  = reshape(rot_200T1(1:end-clip_200T1),10,length(rot_200T1(1:end-clip_200T1))/10)';
temp_200T1_mat = reshape(temp_200T1(1:end-clip_200T1),10,length(temp_200T1(1:end-clip_200T1))/10)';
%This gets the averages for each 0.1 seconds using the previous 10 0.01 dts
time_200T1_av = time_200T1_mat(:,1);%the measurement at each instant will be the average over the previous 0.01 s
disp_200T1_av = [disp_200T1(1,1);mean(disp_200T1_mat')'];disp_200T1_av = disp_200T1_av(1:end-1);
rot_200T1_av  = [rot_200T1(1,1) ;mean(rot_200T1_mat')'] ;rot_200T1_av = rot_200T1_av(1:end-1);
temp_200T1_av = [temp_200T1(1,1);mean(temp_200T1_mat')'];temp_200T1_av = temp_200T1_av(1:end-1);


filename = 'heating_wire_200g_2cycles_T2_high_disp_no_header.csv';
num200T2 = csvread(filename);
time_200T2_raw = num200T2(:,1);
disp_200T2_raw = num200T2(:,2); %this is in mm
rot_200T2_raw = disp_200T2_raw/3*180/pi;
temp_amb_200T2_raw = num200T2(:,3);
temp_200T2_raw = num200T2(:,4);
%This gets all the data on 0.01 dt
time_200T2 = 0:0.01:max(time_200T2_raw);
disp_200T2 = interp1(time_200T2_raw,disp_200T2_raw,time_200T2);
rot_200T2  = interp1(time_200T2_raw,rot_200T2_raw, time_200T2);
temp_200T2 = interp1(time_200T2_raw,temp_200T2_raw,time_200T2);
%This reshapes the data into rows of 10 so I then can average each row to
%do a moving aberage every 0.1 s
%Need to clip the last 0.03 s to get the right number of elements
clip_200T2 = 1+sum(time_200T2*10>floor(max(time_200T2)*10));
time_200T2_mat = reshape(time_200T2(1:end-clip_200T2),10,length(time_200T2(1:end-clip_200T2))/10)';
disp_200T2_mat = reshape(disp_200T2(1:end-clip_200T2),10,length(disp_200T2(1:end-clip_200T2))/10)';
rot_200T2_mat  = reshape(rot_200T2(1:end-clip_200T2),10,length(rot_200T2(1:end-clip_200T2))/10)';
temp_200T2_mat = reshape(temp_200T2(1:end-clip_200T2),10,length(temp_200T2(1:end-clip_200T2))/10)';
%This gets the averages for each 0.1 seconds using the previous 10 0.01 dts
time_200T2_av = time_200T2_mat(:,1);%the measurement at each instant will be the average over the previous 0.01 s
disp_200T2_av = [disp_200T2(1,1);mean(disp_200T2_mat')'];disp_200T2_av = disp_200T2_av(1:end-1);
rot_200T2_av  = [rot_200T2(1,1) ;mean(rot_200T2_mat')'] ;rot_200T2_av = rot_200T2_av(1:end-1);
temp_200T2_av = [temp_200T2(1,1);mean(temp_200T2_mat')'];temp_200T2_av = temp_200T2_av(1:end-1);


fig_rot_and_temp_v_t = figure;
%subplot(2,1,1)
[AX1,H1,H2] = plotyy(time_200T1_av,rot_200T1_av-rot_200T1_av(1),time_200T1_av,temp_200T1_av-temp_200T1_av(1)); hold on
xlabel(AX1(1),'Time (s)')
ylabel(AX1(2),'Internal temperature change (^\circC)')
ylabel(AX1(1),'Rotation (degrees)')
ylim(AX1(1),[-1 5])
ylim(AX1(2),[-5 25])
AX1(1).YTick = [-1:1:5];
AX1(2).YTick = [-5:5:25];
AX1(1).XLim = [0 320];
AX1(2).XLim = [0 320];
title('5.89 N-mm Preload Torque')
%legend('Rotation','Temperature','Location','Northwest')
grid on 
% 
% subplot(2,1,2)
% [AX1,H1,H2] = plotyy(time_200T2_av,rot_200T2_av-rot_200T2_av(1),time_200T2_av,temp_200T2_av-temp_200T2_av(1)); hold on
% xlabel(AX1(1),'Time (s)')
% ylabel(AX1(2),'Internal temperature change (^\circC)')
% ylabel(AX1(1),'Rotation (degrees)')
% ylim(AX1(1),[0 20])
% ylim(AX1(2),[0 120])
% AX1(1).YTick = [0:2:20];
% AX1(2).YTick = [0:20:120];
% AX1(1).XLim = [0 2050];
% AX1(2).XLim = [0 2050];
% title('8.83 N-mm Preload Torque')
% legend('Rotation','Temperature','Location','Northeast')
% grid on 

%saveas(fig_rot_and_temp_v_t,'TIMEPLOT_100300P','tif')


fig_rot_v_temp = figure;
para = [ 0 0.4470 0.7410]; %COLOR
plot(temp_200T1_av-temp_200T1_av(1),rot_200T1_av-rot_200T1_av(1),'Color',para,'LineStyle','--'); hold on
plot(temp_200T2_av-temp_200T2_av(1),rot_200T2_av-rot_200T2_av(1),'Color',para,'LineStyle','-'); hold on
xlabel('Internal temperature change (^\circC)')
ylabel('Rotation (degrees)')
legend('2.94 N-mm Preload Torque','8.83 N-mm Preload Torque','Location','Northwest')
grid on
ylim([-10 40])
%saveas(fig_rot_v_temp,'ROT_V_TEMP_100300P','tif')

% 
% 

