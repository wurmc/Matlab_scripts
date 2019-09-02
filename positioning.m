clear all;
% script to find out which RPs can be delimited from each other
filename = '\20190625_FP_Referenz\20190625_Ref_FP_D14-4-1-13_Dist_inner+outer.csv';
data = dlmread(filename,';',1,7);
help = 1:1:size(data);
good = data;
good(good<0) = [];
% possibly sort the data for better presentation
data = sort(data);

% if value in data is >0, RPs can be delimited
figure;
plot(help, data,'-o');
hold on;
hline(0,'r--',sprintf('all points above this line represent distinguishable point clouds of positions'));
ylabel('outerDist(x,y) - (maxInnerDist(x) + maxInnerDist(y))');
xlabel('sort outer distance combinations between all 13 positions');
