function plot_rh(HRA_time,HRA_temp,HRA_humidity, RPG_time,RPG_temp,RPG_humidity)
    global figure_num;
    global dateStr;
    xData = linspace(HRA_time(1),HRA_time(end),5);
    figure('name','环境温湿度曲线');
    figure_num = figure_num + 1;
    yyaxis left
    plot(datenum(HRA_time) ,HRA_temp,'r-',datenum(RPG_time),RPG_temp,'g-','linewidth',2);
    ylabel('环境温度/℃');    
    yyaxis right
    plot(datenum(HRA_time) ,HRA_humidity,'b-.',datenum(RPG_time),RPG_humidity,'k-.');
    ylabel('相对湿度/%');    
    xlabel('时间/(时:分)');   
    title([dateStr,'环境温湿度曲线']);
    legend('HRA温度','RPG温度','HRA湿度','RPG湿度');
    set(gca,'FontSize',14);
    grid on;
    ax = gca;
    ax.XTick = datenum(xData);
    datetick(ax,'x','HH:MM','keepticks');
    set (gcf,'Position',[100,100,1000,800], 'color','w');
    hold off;
    save2word([dateStr,'_compare.doc'],'-f');
end