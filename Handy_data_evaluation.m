clear all;
close all;

%iterate over measurements
for i = 1:1:10
    % create filename
    filename = sprintf('%s%i%s','\20190613_Kalibrierung\WLAN\20190624\Handy81\21m2\WLAN_Mi81_21m_0', i, '.csv');
    
    % read data fom file
    Mdata=dlmread(filename,';');
    finterval=1:length(Mdata);
    Mdata_delog(:,1)=10.^(Mdata(:,1)./10);

    %% calculate arithmetic mean of measured power values
    Prx=sum(Mdata_delog)./length(Mdata);
    Prx_dB=10*log10(Prx);
    disp(Prx_dB);

    %% let's plot it
%     figure;
%     plot(finterval,Mdata(:,1));
%     xlabel('index [s] ');
%     ylabel('PDS [dBm]');%Power Density Spectrum
%     %vline([X(min(finterval))./1e+6 X(max(finterval))./1e+6],'r--');
%     hline(Prx_dB,'r--',sprintf('P_{rx}=%.2f dBm',Prx_dB));
end
