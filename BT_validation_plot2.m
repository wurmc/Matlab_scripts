% create matrix 90x8 for all measured values, initialise with zeros
M = zeros(87,8);
% create Avg matrix 9x1, initialise with zeros
Avg = zeros(9,1);
% iterate over 9 measured distances 0-8m
for i = 0:1:8
    % create filename
    filename = sprintf('%s%i%s','Bluetooth/d', i, 'm.csv');
    % read data from file
    help1 = dlmread(filename,';',[0 1 28 1]);
    help2 = dlmread(filename,';',[0 2 28 2]);
    help3 = dlmread(filename,';',[0 3 28 3]);
    % put values into one matrix M at column i+1
    M(:,i+1) = [help1; help2; help3];
    % eliminate zeros out of vector
    helpM = M(:,i+1);
    helpM(helpM==0) = [];
    % calculate average of helpM
    Avg(i+1) = mean(helpM);
    % create distance matrix with size of helpM: [distance, values]
    switch i
        case 0 % disteance = 0m
            D0(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D0(1:size(helpM),2) = helpM;
        case 1 % disteance = 1m
            D1(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D1(1:size(helpM),2) = helpM;
        case 2 % disteance = 2m
            D2(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D2(1:size(helpM),2) = helpM;
        case 3 % disteance = 3m
            D3(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D3(1:size(helpM),2) = helpM;
        case 4 % disteance = 4m
            D4(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D4(1:size(helpM),2) = helpM;
        case 5 % disteance = 5m
            D5(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D5(1:size(helpM),2) = helpM;
        case 6 % disteance = 6m
            D6(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D6(1:size(helpM),2) = helpM;
        case 7 % disteance = 7m
            D7(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D7(1:size(helpM),2) = helpM;
        case 8 % disteance = 8m
            D8(1:size(helpM),1) = i * ones(size(helpM,1), 1);
            D8(1:size(helpM),2) = helpM;
    end
end

% 95% confidece intervall using confdelta
C0 = confdelta(D0(:,2),1.96,1);
C1 = confdelta(D1(:,2),1.96,1);
C2 = confdelta(D2(:,2),1.96,1);
C3 = confdelta(D3(:,2),1.96,1);
C4 = confdelta(D4(:,2),1.96,1);
C5 = confdelta(D5(:,2),1.96,1);
C6 = confdelta(D6(:,2),1.96,1);
C7 = confdelta(D7(:,2),1.96,1);
C8 = confdelta(D8(:,2),1.96,1);
% put all confidence values into one vector
C = [C0;C1;C2;C3;C4;C5;C6;C7;C8];
% values for x axis
D = 0:1:8;

figure;
% plot measured values
plot(D0(:,1),D0(:,2),'.',0,Avg(0+1),'*',D1(:,1),D1(:,2),'.',1,Avg(1+1),'*',D2(:,1),D2(:,2),'.',2,Avg(2+1),'*',D3(:,1),D3(:,2),'.',3,Avg(3+1),'*',D4(:,1),D4(:,2),'.',4,Avg(4+1),'*',D5(:,1),D5(:,2),'.',5,Avg(5+1),'*',D6(:,1),D6(:,2),'.',6,Avg(6+1),'*',D7(:,1),D7(:,2),'.',7,Avg(7+1),'*',D8(:,1),D8(:,2),'.',8,Avg(8+1),'*');
hold on;
% create error bars for all distances
errorbar(D,Avg,C,'o');