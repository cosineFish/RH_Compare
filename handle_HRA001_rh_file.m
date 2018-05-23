function [HRA_time,pressure,HRA_temp,HRA_humidity] = handle_HRA001_rh_file(filepath,filename)
    format_data = '';
    for i = 1:1:86%前6个是时间，第64个是压强
        format_data = strcat(format_data,'%f ');
    end
    complete_file = strcat(filepath,filename);
    fidin = fopen(complete_file,'r+');
    sourceData = textscan(fidin,format_data,'CommentStyle','#');
    fclose(fidin);
    HRA_time = datetime(sourceData{1},sourceData{2},sourceData{3},sourceData{4},sourceData{5},sourceData{6});
    HRA_temp = sourceData{11};HRA_humidity = sourceData{12};pressure = sourceData{64};
    format_onlyDate = 'yymmdd';
    startDate = datestr(HRA_time(1),format_onlyDate);startMonth = datestr(HRA_time(1),'yymm');
    %endDate = datestr(time(end),format_onlyDate);
    global dateStr;dateStr = startDate;
%     if startDate == endDate
%         dateStr = startDate;
%     else
%         dateStr = [startDate,'~',endDate];
%     end
    global xlsFilePath;
    xlsFilePath = ['data_',startMonth,'.xls'];
end