clc; close all; clear all;

textSizeSmall=14;
textSizeLarge=16;
set(0,'defaultFigureColor','w','defaultAxesColor','w');
set(0,'defaultAxesFontSize',textSizeSmall,'defaultAxesFontName','Helvetica');
set(0,'defaultFigurePosition',[1200,100,500,400])
set(0,'defaultAxesYMinorTick','on');
set(0,'defaultAxesXMinorTick','on');
set(0,'defaultAxesColorOrder',[ 0 0 0; ...
                                0.8 0 0; ...
                                0.7 0.6 0; ...
                                0 0.7 0; ...
                                0 0 0.8]);
set(0,'defaultAxesLineStyleOrder','-|--|:');
set(0,'defaultAxesBox','on'   );
set(0,'defaultAxesTickLength',  [0.015 0.025]   );        
set(0,'defaultLineLineWidth',1.5   );
set(0,'defaultTextFontName','Helvetica' );
set(0,'defaultTextFontsize',14 );


open('BestTuningEver.fig');

h = gcf; %current figure handle   
axesObjs = get(h, 'Children');  %axes handles
dataObjs = get(axesObjs, 'Children');
xdata = get(dataObjs, 'XData');  %data from low-level grahics objects
ydata = get(dataObjs, 'YData');

normX=xdata; normY=ydata;
close gcf;


open('Filter2Dual.fig');
% open('Filter2DUAL.fig');

h = gcf; %current figure handle   
axesObjs = get(h, 'Children');  %axes handles
dataObjs = get(axesObjs, 'Children');
% xdata = get(dataObjs, 'XData');  %data from low-level graphics objects
% ydata = get(dataObjs, 'YData');
% xdata = get(dataObjs{2}, 'XData');  %data from low-level graphics objects
% ydata = get(dataObjs{2}, 'YData');
xdata = cell2mat(get(dataObjs, 'XData'));  %data from low-level graphics objects
ydata = cell2mat(get(dataObjs, 'YData'));
% xdata = cell2mat(get(dataObjs{2}, 'XData'));  %data from low-level graphics objects
% ydata = cell2mat(get(dataObjs{2}, 'YData'));
close gcf;

figure1=figure;
hold all;

name='Measured';
name={      '+0 K' , ...         %both tuned
             '+9 K' , ...
             '+24 K' , ...
             '+37 K' , ...
             '+54 K' };




maxiii=length(xdata(:,1));
for iii = maxiii:-1:1
    normYadj=interp1(normX, normY, xdata(iii,:));
    realY(iii,:)=ydata(iii,:)-normYadj-max(ydata(1,:)-normYadj)-0.5;
    %close all;
    plot(xdata(iii,:),realY(iii,:));
    %plot(xdata(iii,:),realY(iii,:),'displayName',name(maxiii+1-iii));
    %plot(xdata(iii,:),ydata(iii,:));
end
reset(gcf);
xlabel('Wavelength [nm]','fontsize',textSizeLarge,'FontName', 'Helvetica');
ylabel('Drop Port [dB]','fontsize',textSizeLarge,'FontName', 'Helvetica');
legend1=legend('show');
set(legend1,'FontSize',textSizeSmall,'FontName','Helvetica','box','off',...
      'Location','NorthEast');
xlim([1500 1560]);
ylim([-49 1]);
set(gcf,'Position',[1350,100,500,400]);