%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% phonon dos: default unit [THz]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

clear 

%%%%%%%%%%%%%%%%%%%%%%%%
material_name = 'GdSbTe-AFM-7U(DFPT-111)';
natom = 6;
xmin = 0;    % frequency range (THz)
xmax = 4.2;   
ymin = 0;    % DOS range    [modes/THz]
ymax = 18;
projected_ymax = 18; % projected DOS range    [modes/meV]
xmax_conf = 40; %From mesh.conf
pitch = 0.01; %From mesh.conf
col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0];
%%%%%%%%%%%%%%%%%%%%%%%%%
% column: energy, total dos                                                
fid=fopen(['projected_dos.dat'],'r');

ndos = xmax_conf/pitch+1;
fgetl(fid);                  
dos = fscanf(fid,repmat('%f ',1,1+natom),[1+natom ndos])'; fgetl(fid);
fclose(fid);
%%% all %%%
figure;
hold on
legend_name = cell(natom,1);
for i_natom = 1:(natom)
    tmp = plot(dos(:,1),dos(:,i_natom+1)','-','Color',col(i_natom+1,:),'LineWidth',1.75); 
    tmp_2(i_natom) = tmp;
    legend_name{i_natom,1} = [ ' the ' num2str(i_natom) ' dos'];
end
legend(tmp_2,{char(legend_name)},'Location','northwest','NumColumns',2);
ylabel('F(w) (modes/THz)'); xlabel('Frequency (THz)');
axis([xmin xmax ymin ymax]);
title([ 'phonon dos, ' material_name ]);
set(gca,'linewidth',2);
set(gca,'FontSize',15)
set(gca,'XMinorTick','on')
x = plot([xmin xmax],[ymax ymax],'k','linewidth',2);
set(get(get(x,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
y = plot([xmax xmax],[ymin ymax],'k','linewidth',2);
set(get(get(y,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
saveas(gcf,['dos_all' '.png']);
