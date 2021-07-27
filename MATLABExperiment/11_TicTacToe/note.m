%% automatic
% clear all
% clc
% global sky;
% n = 500;
% tictactoe_robotic();
% results = zeros(1,n);
% for i = 1:n
%     tictactoe_robotic('blue');
%     results(i) = sky;
%     %pause(0.5);
%     tictactoe_robotic();
% end
% draw_times = length(find(results==0));
% blue_win_times = length(find(results==-1));
% green_win_times = length(results)-draw_times-blue_win_times;
% figure(2)
% pie([draw_times,blue_win_times,green_win_times]);
% legend('Draw','Blue Wins','Green Wins');
%% automatic with center strategy
clear all
clc
global sky;
n = 500;
tictactoe_robotic_center();
results = zeros(1,n);
for i = 1:n
    tictactoe_robotic_center('blue');
    results(i) = sky;
    %pause(0.5);
    tictactoe_robotic_center();
end
draw_times = length(find(results==0));
blue_win_times = length(find(results==-1));
green_win_times = length(results)-draw_times-blue_win_times;
figure(2)
pie([draw_times,blue_win_times,green_win_times]);
legend('Draw','Blue Wins','Green Wins');