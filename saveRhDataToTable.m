function saveRhDataToTable(HRA_time,HRA_pressure,HRA_temp,HRA_humidity ,RPG_time,RPG_pressure,RPG_temp,RPG_humidity)
    global xlsFilePath;
    global dateStr;
    global rnames;
    rnames = {'HRA均值','差值均值','峰峰值'};
    cnames = {'压强/mbar','温度/℃','相对湿度/%'};
    HRA_average = [mean(HRA_pressure) mean(HRA_temp) mean(HRA_humidity)];
    data_no_empty = ismember(HRA_time,RPG_time);
    HRA_temp_SameTime = HRA_temp(data_no_empty,:);
    RPG_temp_SameTime = RPG_temp(data_no_empty,:);
    HRA_humidity_SameTime = HRA_humidity(data_no_empty,:);
    RPG_humidity_SameTime = RPG_humidity(data_no_empty,:);
    HRA_pressure_SameTime = HRA_pressure(data_no_empty,:);
    RPG_pressure_SameTime = RPG_pressure(data_no_empty,:);
    delta_temp = HRA_temp_SameTime - RPG_temp_SameTime;
    delta_humidity = HRA_humidity_SameTime - RPG_humidity_SameTime;
    delta_pressure = HRA_pressure_SameTime - RPG_pressure_SameTime;
    average = [ mean(delta_pressure) mean(delta_temp) mean(delta_humidity)];
    pp_value = [max(delta_pressure)-min(delta_pressure) ...
        max(delta_temp)-min(delta_temp) ...
        max(delta_humidity)-min(delta_humidity)];
    data_sensor = [HRA_average;average;pp_value];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %保存传感器数据表格
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    title = ['传感器数值(测量日期:',dateStr,')'];
    write2xls(xlsFilePath,title,cnames,data_sensor,length(cnames));
end