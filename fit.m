%% 电流增量式OCV拟合_拟合脚本
% @warnning: 先运行Incr_OCV.m获取数据
% @author: Ethan Wang
% @date: 2024.5.9处理

hold on;
SOC = 0.1:0.1:0.9;
x = 0.1:0.02:0.9;

%% 0C
OCV_0 = process(data_0);
p_0 = polyfit(SOC,OCV_0, 6);
plot(x, polyval(p_0, x), "LineStyle","--","Color","k","LineWidth",1.5);



%% 25C
OCV_25 = process(data_25);
p_25 = polyfit(SOC,OCV_25, 6);
plot(x, polyval(p_25, x), "LineStyle","--","Color","b","LineWidth",1.5);


%% 45C
OCV_45 = process(data_45);
p_45 = polyfit(SOC,OCV_45, 6);
plot(x, polyval(p_45, x), "LineStyle","--","Color","r","LineWidth",1.5);

%% 图标注
xlabel("SOC", "FontName", "Times New Roman");
ylabel("Voltage(V)", "FontName","Times New Roman");
l = legend("Incrumental OCV@0℃","Incrumental OCV@25℃","Incrumental OCV@45℃");
set(l, 'FontName', 'Times New Roman', 'FontSize', 12, 'LineWidth', 1.5, "Location", "northwest");

