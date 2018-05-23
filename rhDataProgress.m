clearvars;clc;
close all;%关闭所有figure窗口
[filename,filepath]=uigetfile('*.*','打开RPG传感器文件');
[RPG_time,RPG_pressure,RPG_temp,RPG_humidity] = handle_RPG_rh_file(filepath,filename);
[filename,filepath]=uigetfile('*.*','打开HRA-001传感器文件');
[HRA_time,HRA_pressure,HRA_temp,HRA_humidity] = handle_HRA001_rh_file(filepath,filename);
global figure_num;
figure_num = 0;
global legend_rect_up;
%global lengend_rect_down;
legend_rect_up = 'NorthEast';%'SouthEast';%[0.8 0.7 0.1 0.05];
%lengend_rect_down = 'NorthEast';%[0.75 0.5 0.1 0.05];
global positionRowNum;
positionRowNum = 0;
%把表格保存到excel，注意excel文件太大（190KB左右）可能导致数据写不进去的情况
saveRhDataToTable(HRA_time,HRA_pressure,HRA_temp,HRA_humidity ,RPG_time,RPG_pressure,RPG_temp,RPG_humidity);
%画压强曲线
plot_pressure(HRA_time,HRA_pressure ,RPG_time,RPG_pressure);
%画温湿度曲线
plot_rh(HRA_time,HRA_temp,HRA_humidity, RPG_time,RPG_temp,RPG_humidity);
%system('taskkill /F /IM EXCEL.EXE');
%清除产生的mat文件
%delete_rh_mat();
close all;%关闭所有图像窗口