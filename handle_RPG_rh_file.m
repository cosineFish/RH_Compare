function [RPG_time,pressure,RPG_temp,RPG_humidity] = handle_RPG_rh_file(filepath,filename)
    format_data = '';
    for i = 1:1:10%前6个是时间，第7个是雨滴，第8个是压强,最后2个是温度、湿度
        format_data = strcat(format_data,'%f ');
    end
    complete_file = strcat(filepath,filename);
    fidin = fopen(complete_file,'r+');  
    sourceData = textscan(fidin,format_data,'Delimiter',',','CommentStyle','#', 'headerlines',11);
    fclose(fidin);
    RPG_time = datetime(sourceData{1}+2000,sourceData{2},sourceData{3},sourceData{4}+8,sourceData{5},sourceData{6});
    pressure = sourceData{8};
    RPG_temp = sourceData{9}-273.17;RPG_humidity = sourceData{10};
end