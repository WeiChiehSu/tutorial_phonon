%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function use to plot band structure form band.yaml
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear 

%%% INPUT PARAMETER %%%
material_name = 'NaCl';
high_symmetry_point_name = {'\Gamma','X','M','\Gamma','R','interpreter','LaTex'};
natom = 2;
hs = 5;       % # of high symmetry point
ymin = 0;    % frequency range [THz]
ymax = 7;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fid = fopen('band.yaml','r');
%%READ DATA%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

line1 = fgetl(fid);                % 1st
line1 = fgetl(fid);                % 2nd 
line1 = fgetl(fid);                % 3nd
nk = str2double(line1(9:13));      % 4nd
nb = natom*3;
hk = nk/(hs-1);                     % q path
Ebnd = zeros(nk,nb);                % memory space of band
k_path = zeros(nk,3);
kd = zeros(1,nk);      
kdr = zeros(1,nk);

for i=1:14+3*natom+hs-1
    line1 = fgetl(fid);
end


for ikk=1:nk
    % 使用 fscanf 來讀取 q-position 中的三個浮點數
    % 這裡的格式字符串跳過了 "A: q-position: [" 和 "]" 並讀取三個浮點
    % fscanf 會返回一個數組，包含讀取的三個浮點數
    q = fscanf(fid, '- q-position: [ %f, %f, %f ]', 3);
        k_path(ikk,1) = q(1);
        k_path(ikk,2) = q(2);
        k_path(ikk,3) = q(3);
        % Distance between two kpoints
        if ikk == 1       
            kdr(1,ikk)=0;
            kd(1,ikk)=0;
        else 
            kdr(1,ikk) = norm( k_path(ikk,:) - k_path(ikk-1,:) );  % Distance between two kpoints          
            kd(1,ikk) = kd(1,ikk-1) + kdr(1,ikk);   % add the distance        
        end
     line1 = fgetl(fid);
     line1 = fgetl(fid);
     line1 = fgetl(fid);

     for i=1:nb 
         line1 = fgetl(fid);
         line1 = fgetl(fid);
         % 使用 sscanf 來讀取 frequency
         % 這裡跳過了"    frequency:" 並讀取-個浮點
         scan_tmp = sscanf(line1, '    frequency: %f');
         Ebnd(ikk,i) = scan_tmp;
         %Ebnd = Ebnd / meV_to_1_over_cm;
     end
     line1 = fgetl(fid);
end

fclose(fid);
%%PLOT FIGURE PROCESS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;

plot(kd,Ebnd,'r','LineWidth',1.5);
axis([0,kd(end),ymin,ymax]);
box on;
% axis square;
ylabel('frequency (THz)');
title(material_name);

x=[0,kd(end)];
y=[0 0];
plot(x,y,'k--')
% Plot high symmetry line
xticks([kd(1,1) kd(1,hk:hk:hk*(hs-1))]);
xticklabels(high_symmetry_point_name);
set(gca,'FontSize',15)
set(gca,'Ticklength',[0 0]);
set(gca,'linewidth',1);
for hh=1:hs-1
    x=[kd(hk*hh) kd(hk*hh)];
    y=[ymin ymax];
    plot(x,y,'k')
end
saveas(gcf,['phonon-band' '.png']);
