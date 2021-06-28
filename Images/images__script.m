%close all
hold off
%clear
clc


cyl_color = [0.9 0.9 0.9]
ppt_line_color = [79/255 129/255 189/255]
Rs = [0.3,1.01]
%Rs = [0.9,3.03]
theta = 0:0.001:2*pi;
c = 1/(2*pi)
hel = 0;
if hel == 1;  
    %HELIX
    for i = 1:length(Rs)
        
        %c = 1;
        r = Rs(i);
        z = theta*c;
        x = r*cos(theta);
        y = r*sin(theta);
        
        if i == 1;
            the_line = '-';
            line_color = [1 0 0];
        else
            the_line = '-';
            line_color = ppt_line_color;
        end
        plot3(x,y,z,the_line,'Linewidth',1,'Color',line_color);
        hold on
    end
    
else
    %Initial polymer chain positons
    for i = 1:length(Rs)
        
        %c = 1;
        r = Rs(i);
        z = theta*c;
        x = r*ones(size(theta));
        y = r*zeros(size(theta));
        
        if i == 1;
            the_line = '-';
            line_color = [1 0 0];
        else
            the_line = '-';
            line_color = ppt_line_color;
        end
        plot3(x,y,z,the_line,'Linewidth',1,'Color',line_color);
        hold on
    end
end

%% Origin Coordinate Frame
x_a1 = [0,1.5];
y_a1 = [0,0];
z_a1 = [0,0];
text(x_a1(2)*1.2,y_a1(2),z_a1(2),'$x$','Interpreter','latex','FontSize',20 )
plot3(x_a1,y_a1,z_a1,'k')

x_a2 = [0,0];
y_a2 = [0,1.5];
z_a2 = [0,0];
text(x_a2(2),y_a2(2)*1.1,z_a2(2),'$y$','Interpreter','latex','FontSize',20 )
plot3(x_a2,y_a2,z_a2,'k')


x_a3 = [0,0];
y_a3 = [0,0];
z_a3 = [0,2*pi*c*1.5];
text(x_a3(2),y_a3(2),z_a3(2)*1.1,'$z$','Interpreter','latex','FontSize',20 )
plot3(x_a3,y_a3,z_a3,'k')


pc_frm_lng = 0.5;
pc_frm_wdth = 2;
pc_frm_ln = ':';
if hel == 0;
    %% Straight PC Coordinate Frame
    x_a1 = [Rs(2),Rs(2)+pc_frm_lng];
    y_a1 = [0,0];
    z_a1 = [0,0];
    %text(x_a1(2)*1.2,y_a1(2),z_a1(2),'$r$','Interpreter','latex','FontSize',20 )
    %plot3(x_a1,y_a1,z_a1,'Color',ppt_line_color,'Linewidth',pc_frm_wdth)
    
    x_a2 = [Rs(2),Rs(2)];
    y_a2 = [0,-pc_frm_lng];
    z_a2 = [0,0];
    text(x_a2(2),y_a2(2)*1.2,z_a2(2),'$2$','Interpreter','latex','FontSize',16,'Color',ppt_line_color)
    plot3(x_a2,y_a2,z_a2,'Color',ppt_line_color,'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    x_a3 = [Rs(2),Rs(2)];
    y_a3 = [0,0];
    z_a3 = [0,pc_frm_lng];
    text(x_a3(2),y_a3(2),z_a3(2)*1.1,'$1$','Interpreter','latex','FontSize',16,'Color',ppt_line_color )
    plot3(x_a3,y_a3,z_a3,'Color',ppt_line_color,'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    x_a1 = [Rs(1),Rs(1)+pc_frm_lng];
    y_a1 = [0,0];
    z_a1 = [0,0];
    %text(x_a1(2)*1.2,y_a1(2),z_a1(2),'$r$','Interpreter','latex','FontSize',20 )
    %plot3(x_a1,y_a1,z_a1,'Color',[1 0 0],'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    x_a2 = [Rs(1),Rs(1)];
    y_a2 = [0,-pc_frm_lng];
    z_a2 = [0,0];
    text(x_a2(2),y_a2(2)*1.2,z_a2(2),'$2$','Interpreter','latex','FontSize',16,'Color',[1 0 0])
    plot3(x_a2,y_a2,z_a2,'Color',[1 0 0],'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    x_a3 = [Rs(1),Rs(1)];
    y_a3 = [0,0];
    z_a3 = [0,pc_frm_lng];
    text(x_a3(2),y_a3(2),z_a3(2)*1.1,'$1$','Interpreter','latex','FontSize',16,'Color',[1 0 0])
    plot3(x_a3,y_a3,z_a3,'Color',[1 0 0],'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
elseif hel == 1
    %% Helix PC Coordinate Frame
    alph = atan(c/Rs(2));
    
    x_a1 = [1.01,1.01+pc_frm_lng];
    y_a1 = [0,0];
    z_a1 = [0,0];
    %text(x_a1(2)*1.2,y_a1(2),z_a1(2),'$r$','Interpreter','latex','FontSize',20 )
    %plot3(x_a1,y_a1,z_a1,'Color',ppt_line_color,'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    x_a2 = [1.01,1.01];
    y_a2 = [0,-pc_frm_lng*sin(alph)];
    z_a2 = [0,pc_frm_lng*cos(alph)];
    text(x_a2(2),y_a2(2)*1.2,z_a2(2)*1.2,'$2$','Interpreter','latex','FontSize',16,'Color',ppt_line_color)
    plot3(x_a2,y_a2,z_a2,'Color',ppt_line_color,'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    x_a3 = [1.01,1.01];
    y_a3 = [0,pc_frm_lng*cos(alph)];
    z_a3 = [0,pc_frm_lng*sin(alph)];
    text(x_a3(2),y_a3(2)*1.2,z_a3(2)*1.2,'$1$','Interpreter','latex','FontSize',16,'Color',ppt_line_color )
    plot3(x_a3,y_a3,z_a3,'Color',ppt_line_color,'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    alph = atan(c/Rs(1));
    
    x_a1 = [Rs(1),Rs(1)+pc_frm_lng];
    y_a1 = [0,0];
    z_a1 = [0,0];
    %text(x_a1(2)*1.2,y_a1(2),z_a1(2),'$r$','Interpreter','latex','FontSize',20 )
    %plot3(x_a1,y_a1,z_a1,'Color',[1 0 0],'Linewidth',pc_frm_wdth)
    
    x_a2 = [Rs(1),Rs(1)];
    y_a2 = [0,-pc_frm_lng*sin(alph)];
    z_a2 = [0,pc_frm_lng*cos(alph)];
    text(x_a2(2),y_a2(2)*1.2,z_a2(2)*1.2,'$2$','Interpreter','latex','FontSize',16,'Color',[1 0 0])
    plot3(x_a2,y_a2,z_a2,'Color',[1 0 0],'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
    x_a3 = [Rs(1),Rs(1)];
    y_a3 = [0,pc_frm_lng*cos(alph)];
    z_a3 = [0,pc_frm_lng*sin(alph)];
    text(x_a3(2),y_a3(2)*1.2,z_a3(2)*1.2,'$1$','Interpreter','latex','FontSize',16,'Color',[1 0 0])
    plot3(x_a3,y_a3,z_a3,'Color',[1 0 0],'Linewidth',pc_frm_wdth,'Linestyle',pc_frm_ln)
    
    
end


%% The Cylinder

hold on
[X Y Z] = cylinder(1,1000);
h_cyl = surf(X,Y,Z*max(z),'Edgecolor','none')
colormap(cyl_color)


%view(135,30)
view(110,20)

[R PHI] = meshgrid(0:0.01:1,theta);
Z_top = zeros(size(R)); % which assumes your function is vectorized
Z_bot =  2*pi*c*ones(size(R)); % which assumes your function is vectorized
surf(R.*cos(PHI), R.*sin(PHI), Z_top,'Edgecolor','none');
surf(R.*cos(PHI), R.*sin(PHI), Z_bot,'Edgecolor','none');
colormap(cyl_color)
%alpha(0.3)


%%Top edge
theta = 0:0.001:2*pi

%c = 1;
r = 1;
x = r*cos(theta);
y = r*sin(theta);
z = 2*pi*c*ones(size(x));

plot3(x,y,z,'Linewidth',1,'Color',cyl_color*0.5)

set(gca,'xlim',[-1.1,1.5],'ylim',[-1.1,1.5],'zlim',[0,10])

%%Bottom edge
 %theta = -pi/2:0.001:pi/2
theta = 0:0.001:2*pi
%c = 1;
r = 1;
x = r*cos(theta);
y = r*sin(theta);
z = 2*pi*c*zeros(size(x));

plot3(x,y,z,'Linewidth',1,'Color',cyl_color*0.5)

alpha(0.5)
set(gcf,'Color',[1 1 1])
set(gca,'Visible','off')

%% Add some light
light('Position',[0 3 0]);
light('Position',[0 0 10]);
%hold off


axis equal


%% Angle Lines
% x_l1 = [0,1.5];
% y_l1 = [0,0];
% z_l1 = [0,0];
% plot3(x_l1,y_l1,z_l1,'--k')
% 
% 
% x_l1 = [0,1.5];
% y_l1 = [0,0];
% z_l1 = [2*pi*c,2*pi*c];
% plot3(x_l1,y_l1,z_l1,'--k')
% 
% 
% 





