%% 电流增量式OCV拟合_数据读取
% @author: Ethan Wang
% @date: 2024.5.9
clc;
clear;

%% 0 C
u_1 = readtable("0C.xls", 'Sheet', "Channel_1-005_1", VariableNamingRule="preserve");
u_2 = readtable("0C.xls", 'Sheet', "Channel_1-005_2", VariableNamingRule="preserve");
u_3 = readtable("0C.xls", 'Sheet', "Channel_1-005_3", VariableNamingRule="preserve");
% 0 C 的电压
data_0 = [u_1; u_2; u_3];

%% 25 C
u_1 = readtable("25C.xlsx", 'Sheet', "Channel_1-005_1", VariableNamingRule="preserve");
u_2 = readtable("25C.xlsx", 'Sheet', "Channel_1-005_2", VariableNamingRule="preserve");
u_3 = readtable("25C.xlsx", 'Sheet', "Channel_1-005_3", VariableNamingRule="preserve");
% 0 C 的电压
data_25 = [u_1; u_2; u_3];


%% 45 C
u_1 = readtable("45C.xlsx", 'Sheet', "Channel_1-005_1", VariableNamingRule="preserve");
u_2 = readtable("45C.xlsx", 'Sheet', "Channel_1-005_2", VariableNamingRule="preserve");
u_3 = readtable("45C.xlsx", 'Sheet', "Channel_1-005_3", VariableNamingRule="preserve");
% 0 C 的电压
data_45 = [u_1; u_2; u_3];
