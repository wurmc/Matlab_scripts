clear all;

% %% randomsample data
% filename = '\kstest\kstest\randomsamples.txt';
% x = dlmread(filename);
% x = sort(x);
% x_steps = min(x):1:max(x);
% %x_steps = 32:0.4:64;
% 
% % do kstest
% disp('result of kstest is: ');
% disp(kstest(x));
% 
% % histogram of values
% % figure;
% % hist(x,50);
% 
% % calculate mu and sigma
% m_x = mean(x);
% s_x = std(x);
% 
% % calculate and plot pdf
% figure;
% histfit(x,30);
% pd = fitdist(x,'Normal');
% disp(pd);
% binranges = min(x):max(x);
% [bincounts] = histc(x,binranges);
% ro_x = bincounts./length(x);
% disp(ro_x);
% 
% % integrate normalized hist values
% bla_x = 0;
% 
% for i = 1:1:length(ro_x)
%     bla_x = bla_x+ro_x(i);
%     help_x(i) = bla_x;
% end
% disp(help_x);
% figure;
% plot(x_steps,help_x,'o');
% hold on;
% % plot ecdf compared to values including standard normal
% %figure;
% cdfplot(x);
% hold on;
% x_values = linspace(min(x),max(x));
% plot(x_values,normcdf(x_values,m_x,s_x),'r-');
% legend('Empirical CDF','Standard Normal CDF','Location','best');
% 
% figure;
% qqplot(x);

%% real data
filename = '\20190625_FP_Referenz\403\Mi9\20190625_D14-403-1_BT_signals.csv';
tmp = dlmread(filename,';',0,1);

for j = 1:1:size(tmp)
    v = transpose(tmp(j,:));
    v(v==0) = [];
    v = sort(v);
    v_steps = min(v):1:max(v);

    % do kstest
    disp('result of kstest is: ');
    disp(kstest(v));

    % histogram of values
    % figure;
    % hist(v(1,:),50);

    % calculate mu and sigma
    m = mean(v);
    s = std(v);

    % calculate and plot pdf
    a = figure('Visible', 'off');
    histfit(v,30);
    xlabel('linear RSS value');
    ylabel('number of occurences');
    % save figure automatically to png
    fig_a = sprintf('%s%i%s','\20190625_FP_Referenz\403\Mi9\figures\20190625_D14-403-1_BT_signals_', j, 'a.eps');
    print(a,'-depsc',fig_a);
    pd = fitdist(v,'Normal');
    disp(pd);
    binranges = min(v):max(v);
    [bincounts] = histc(v,binranges);
    ro = bincounts./length(v);
    disp(ro);

    % integrate normalized hist values
    bla = 0;
    for i = 1:1:length(ro)
        bla = bla+ro(i);
        help(i) = bla;
    end
    disp(help);
    b = figure('Visible', 'off');
    plot(v_steps,help,'x');
    hold on;

    % plot ecdf compared to values including standard normal
    %figure;
    cdfplot(v);
    hold on;
    v_values = linspace(min(v),max(v)); 
    plot(v_values,normcdf(v_values,m,s),'r-');
    legend('Empirical CDF','Standard Normal CDF','Location','best');
    % save figure automatically to png
    fig_b = sprintf('%s%i%s','\20190625_FP_Referenz\404\Mi9\figures\20190625_D14-404-6_Cell_signals_', j, 'b.png');
    print(b,'-dpng',fig_b);

    c = figure('Visible', 'off');
    qqplot(v);
    % save figure automatically to png
    fig_c = sprintf('%s%i%s','\20190625_FP_Referenz\404\Mi9\figures\20190625_D14-404-6_Cell_signals_', j, 'c.png');
    print(c,'-dpng',fig_c);
    clear v;
end