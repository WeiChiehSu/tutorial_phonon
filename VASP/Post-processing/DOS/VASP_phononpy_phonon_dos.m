%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phonon dos: default unit [THz]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

clear 

%%%%%%%%%%%%%%%%%%%%%%%%
material_name = 'GdSbTe-AFM-7U(DFPT-111)';
natom = 6;
xmin = 0;    % frequency range (THz)
xmax = 5;   
ymin = 0;    % DOS range    [modes/THz]
ymax = 8;
col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0];
xmax_conf = 5; %From mesh.conf
pitch = 0.001; %From mesh.conf
%%%%%%%%%%%%%%%%%%%%%%%%%
% column: energy, total dos                                                
fid=fopen([ 'total_dos.dat'],'r');

ndos = xmax_conf/pitch+1;
fgetl(fid);                  
dos = fscanf(fid,repmat('%f ',1,2),[2 ndos])'; fgetl(fid);
fclose(fid);
%%% plot %%%
figure;
hold on
plot(dos(:,1),dos(:,2)/natom,'-','Color',col(1,:),'LineWidth',1.5);
ylabel('F(w) (modes/THz)'); xlabel('Frequency (THz)');
legend(' total dos ','Location','northwest','NumColumns',2);
axis([xmin xmax ymin ymax]);
%view(-90,-90);
title([ 'phonon dos, ' material_name ]);
set(gca,'linewidth',2);
% set(gca,'Ticklength',[0.02 0.035]);
set(gca,'FontSize',15)
set(gca,'XMinorTick','on')
x = plot([xmin xmax],[ymax ymax],'k','linewidth',2);
set(get(get(x,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
y = plot([xmax xmax],[ymin ymax],'k','linewidth',2);
set(get(get(y,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
saveas(gcf,['dos_total' '.png']);
