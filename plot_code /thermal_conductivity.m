%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% thermal_conductivity: default unit [1/cm]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
clear 
%%%%%%%%%%%%%%%%%%%%%%%%
material_name = 'Si';
natom = 2;
TMIX = 0;
TMAX =1000;
Primitive_matrix = 0; % 0 or 4 (check out.dat)
TSTEP = 10;
ymin = 0;    % DOS range    [modes/meV]
ymax = 67000;
xmax_conf = 10; %From mesh.conf
pitch = 0.01; %From mesh.conf
projected_ymax = 1.6; % projected DOS range    [modes/meV]
col = [1 0 0;0 1 0;0 0 1;0 1 1;1 0 1;1 1 0;0 0 0];
if (1 + natom) > 7
   col_tmp = zeros(1+natom,3);
   col_tmp(1:7,:) = col(:,:);
   for i = 8:(1+natom)
       col_tmp(i,:) = rand(1,3);
   end
   col = col_tmp;
end
%%%%%%%%%%%%%%%%%%%%%%%%%
% column: energy, total dos, projected 1 atom dos, projected 2 atom dos, etc.                                                  
fid = fopen('out.dat','r');

for i=1:50-Primitive_matrix
%for i=1:47+Grid_point*(natom*3+5)
    line1 = fgetl(fid);
end

line1 = fgetl(fid);
triplets = sscanf(line1, 'Number of triplets: %f');

for i=1:7+(triplets-1)*(natom*3+5)+1
    line1 = fgetl(fid);
end


ndos = (TMAX-TMIX)/TSTEP;
line1 = fgetl(fid);
line1 = fgetl(fid);
line1 = fgetl(fid);
dos = fscanf(fid,repmat('%f ',1,7),[7 ndos])'; fgetl(fid);
fclose(fid);
%%% plot %%%
figure;
hold on
for i_natom = 1:6
    plot(dos(:,1),dos(:,i_natom+1)','-','Color',col(i_natom,:),'LineWidth',1.75); 
end
legend({'xx','yy','zz','yz','xz','xy'},'Location','northeast','NumColumns',1);
xlabel('Temperature (K)');
ylabel('Thermal conductivity (W/m-k)');
axis([TMIX TMAX ymin ymax]);
title([ 'Thermal conductivity, ' material_name ]);
set(gca,'linewidth',2);
% set(gca,'Ticklength',[0.02 0.035]);
set(gca,'FontSize',15)
set(gca,'XMinorTick','on')
x = plot([TMIX TMAX],[ymax ymax],'k','linewidth',2);
set(get(get(x,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
y = plot([TMAX TMAX],[ymin ymax],'k','linewidth',2);
set(get(get(y,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
saveas(gcf,['thermal_conductivity' '.png']);
