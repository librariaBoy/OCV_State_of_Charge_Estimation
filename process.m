%% 电流增量式OCV拟合_处理函数
% @author: Ethan Wang
% @date: 2024.5.9
function OCV = process(data)
    % 获取每个cycle的次数
    index = data.Cycle_Index;
    index = unique(index);
    max_index = length(index);

    % 存放OCV数据
    OCV = [];

    for i = 1:max_index
        % 生成一个对应第i次循环的子表
        subTable = data(data.Cycle_Index == i, :);
        
        % 计算停止充放电后的平均电压为OCV
        avg = sum((subTable.Step_Index == 6 | subTable.Step_Index == 10) .* subTable.("Voltage(V)"))/sum(subTable.Step_Index == 6 | subTable.Step_Index == 10);
        
        % 加入OCV种
        if avg ~= 0
            OCV = [OCV; avg];
        end
    end

    % SOC与OCV对应
    init_SOC = 0.9;

    % 存储这个过程的SOC分别的值
    SOC = zeros(length(OCV), 1);

    % 符号,用于改变SOC变化方向
    sgn = -1;

    for i = 1:length(OCV)

        SOC(i) = init_SOC;

        % SOC变成0.1了，改变变化方向
        if abs(init_SOC) < 10e-6
            sgn = 1;
        end

        init_SOC = init_SOC + sgn*0.1;

    end

    % 按从0.1到0.9的顺序计算求平均值
    datagram = [SOC,OCV];

    OCV = zeros(9,1);

    i = 1;

    while datagram(i,1) > 10e-6
        
        % 检查是否有两个SOC
        flag = false;

        for j = i+1:size(datagram,1)
            if datagram(i,2) == datagram(j,2)
                flag = true;
                OCV(i) = (datagram(i,2) + datagram(j,2))/2;
            end
        end

        if flag == false
            OCV(i) = datagram(i,2);
        end
        
        i = i + 1;
    end

    OCV = flip(OCV);
end












