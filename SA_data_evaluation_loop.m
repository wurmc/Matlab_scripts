clear all;
close all;

%iterate over measurements
for i = 1:1:3
    % create filename
    filename = sprintf('%s%i%s','\20190625_FP_Referenz\4Flur\SA\13\20190625_2432MHz_140MHz_13_0', i, '.csv');
    finterval=172:559;

    Mdata=dlmread(filename,';');
    X=Mdata(:,1);

    %% help to find out the relevant interval of indices
    % bla=size(Mdata(:,1));
    % tmp=1:bla;
    % plot(tmp,Mdata(:,2));

    %Prx = sum(My, 'all')/size(Mx,1);
    Mdata_delog(:,2)=10.^(Mdata(:,2)./10);
    Mdata_delog(:,1)=X;

    %% calculate arithmetic mean of measured power values
    Prx=sum(Mdata_delog(finterval,2))./length(finterval);
    Prx_dB=10*log10(Prx);
    disp(Prx_dB);

    %% let's plot it
    figure;
    plot(Mdata(:,1)./1e+6,Mdata(:,2));
    xlabel('f [MHz]');
    ylabel('PDS [dBm/Hz]');%Power Density Spectrum
    vline([X(min(finterval))./1e+6 X(max(finterval))./1e+6],'r--');
    hline(Prx_dB,'r--',sprintf('P_{rx}=%.2f dBm',Prx_dB));
end