clearvars;clc;
close all;%�ر�����figure����
[filename,filepath]=uigetfile('*.*','��RPG�������ļ�');
[RPG_time,RPG_pressure,RPG_temp,RPG_humidity] = handle_RPG_rh_file(filepath,filename);
[filename,filepath]=uigetfile('*.*','��HRA-001�������ļ�');
[HRA_time,HRA_pressure,HRA_temp,HRA_humidity] = handle_HRA001_rh_file(filepath,filename);
global figure_num;
figure_num = 0;
global legend_rect_up;
%global lengend_rect_down;
legend_rect_up = 'NorthEast';%'SouthEast';%[0.8 0.7 0.1 0.05];
%lengend_rect_down = 'NorthEast';%[0.75 0.5 0.1 0.05];
global positionRowNum;
positionRowNum = 0;
%�ѱ�񱣴浽excel��ע��excel�ļ�̫��190KB���ң����ܵ�������д����ȥ�����
saveRhDataToTable(HRA_time,HRA_pressure,HRA_temp,HRA_humidity ,RPG_time,RPG_pressure,RPG_temp,RPG_humidity);
%��ѹǿ����
plot_pressure(HRA_time,HRA_pressure ,RPG_time,RPG_pressure);
%����ʪ������
plot_rh(HRA_time,HRA_temp,HRA_humidity, RPG_time,RPG_temp,RPG_humidity);
%system('taskkill /F /IM EXCEL.EXE');
%���������mat�ļ�
%delete_rh_mat();
close all;%�ر�����ͼ�񴰿�