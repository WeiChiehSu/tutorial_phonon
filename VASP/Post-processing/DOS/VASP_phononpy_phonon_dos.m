%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phonon dos: default unit [1/cm]
% change unit from [1/cm] to [meV]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

clear 

%%%%%%%%%%%%%%%%%%%%%%%%
material_name = 'GdSbTe-AFM-7U(DFPT-111)';
natom = 6;
Ry_to_meV = 13.605691930242388 * 1000;
meV_to_1_over_cm = 109737.3157 / Ry_to_meV;
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
%dos(:,1) = dos(:,1) / meV_to_1_over_cm;
%dos(:,2:end) = dos(:,2:end) * meV_to_1_over_cm;
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
save dos_data.mat natom ndos dos
cd ..
