clear all;
close all;

SA_filename = '\20190613_Kalibrierung\WLAN\20190624\SA\WLAN_SA_Avg_21m2.csv';
Mi_filename = '\20190613_Kalibrierung\WLAN\20190624\Handy81\WLAN_Mi81_Avg_21m2.csv';

% read data from file
SA_data=dlmread(SA_filename);
Mi_data=dlmread(Mi_filename);

%% let's plot it
figure;
scatter(SA_data, Mi_data);
title('WLAN 21m - Mi8.1')
xlabel('SA RSSI [dBm]');
ylabel('Mi8.1 RSSI [dBm]');