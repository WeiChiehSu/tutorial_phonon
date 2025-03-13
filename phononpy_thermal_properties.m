%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function use to plot Thermal properties form thermal_properties.yaml
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 
%%% INPUT PARAMETER %%%
material_name = '114514';
natom = 2;
TMIX = 0;
TMAX =1000;
TSTEP = 10;
ymin = -100;
ymax = 250;
col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('thermal_properties.yaml','r');
%%READ DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     for i=1:16
         line1 = fgetl(fid);
     end

     ndos = (TMAX-TMIX)/TSTEP+1;
     temperature = zeros(1,ndos);
     free_energy = zeros(1,ndos);
     entropy = zeros(1,ndos);
     heat_capacity = zeros(1,ndos);
     energy = zeros(1,ndos);

     for i=1:ndos 
         line1 = fgetl(fid);
         scan_tmp = sscanf(line1, '- temperature: %f');
         temperature(1,i) = scan_tmp;
         line1 = fgetl(fid);
         scan_tmp = sscanf(line1, '  free_energy: %f');
         free_energy(1,i) = scan_tmp;
         line1 = fgetl(fid);
         scan_tmp = sscanf(line1, '  entropy: %f');
         entropy(1,i) = scan_tmp;
         line1 = fgetl(fid);
         scan_tmp = sscanf(line1, '  heat_capacity: %f');
         heat_capacity(1,i) = scan_tmp;
         line1 = fgetl(fid);
         scan_tmp = sscanf(line1, '  energy: %f');
         energy(1,i) = scan_tmp;
         line1 = fgetl(fid); 
     end

fclose(fid);
%% PLOT ALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

hold on;
plot(temperature,free_energy,'-','Color',col(1,:),'LineWidth',1.75);
axis([TMIX TMAX ymin ymax]);
hold on;
plot(temperature,entropy,'-','Color',col(3,:),'LineWidth',1.75);
axis([TMIX TMAX ymin ymax]);
hold on;
plot(temperature,heat_capacity,'-','Color',col(2,:),'LineWidth',1.75);
axis([TMIX TMAX ymin ymax]);
hold on;
plot(temperature,energy,'-','Color',col(7,:),'LineWidth',1.75);
axis([TMIX TMAX ymin ymax]);
box on;
legend({'Free energy [kJ/mol]','Entropy [J/K/mol]','C_v [J/K/mol]','Phonon energy [ev]'},'Location','northwest','NumColumns',1);
xlabel('Temperature (K)');
title(material_name);
title([ material_name ' Thermal properties ']);
set(gca,'linewidth',2);
set(gca,'FontSize',15)
set(gca,'XMinorTick','on')
x = plot([TMIX TMAX],[ymax ymax],'k','linewidth',2);
set(get(get(x,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
y = plot([TMAX TMAX],[ymin ymax],'k','linewidth',2);
set(get(get(y,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
saveas(gcf,['total_thermal_properties' '.png']);
