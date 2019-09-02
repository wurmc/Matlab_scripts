clear all;

filename = '\20190625_FP_Referenz\403\Mi9\20190625_D14-403-1_WLAN_signals.csv';
tmp = dlmread(filename,';',0,1);

for j = 1:1:size(tmp)
    v = transpose(tmp(j,:));
    v = sort(v);
    % plot histogram
    a = figure('Visible', 'off');
    hist(v,30);
    xlabel('linear RSS value');
    ylabel('number of occurences');
    % save figure automatically
    fig_a = sprintf('%s%i%s','\20190625_FP_Referenz\403\Mi9\figures\20190625_D14-403-1_WLAN_signals_', j, 'a.eps');
    print(a,'-depsc',fig_a);
    
    c = figure('Visible', 'off');
    qqplot(v);
    % save figure automatically
    fig_c = sprintf('%s%i%s','\20190625_FP_Referenz\403\Mi9\figures\20190625_D14-403-1_WLAN_signals_', j, 'c.eps');
    print(c,'-depsc',fig_c);
    clear v;
end