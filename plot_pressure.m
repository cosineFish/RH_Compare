function plot_pressure(HRA_time,HRA_pressure ,RPG_time,RPG_pressure)
    global figure_num;
    global dateStr;
    xData = linspace(HRA_time(1),HRA_time(end),5);
    figure('name','压强曲线');
    figure_num = figure_num + 1;
    plot(datenum(HRA_time) ,HRA_pressure,'r-',datenum(RPG_time),RPG_pressure,'g-');
    ylabel('压强/mbar');    
    xlabel('时间/(时:分)');   
    title([dateStr,'压强曲线']);
    legend('HRA','RPG');
    set(gca,'FontSize',14);
    grid on;
    ax = gca;
    ax.XTick = datenum(xData);
    datetick(ax,'x','HH:MM','keepticks');
    set (gcf,'Position',[100,100,1000,800], 'color','w');
    hold off;
    save2word([dateStr,'_compare.doc'],'-f');
end