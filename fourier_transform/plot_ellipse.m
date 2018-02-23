function output = plot_ellipse(a,b,cx,cy,angle,color) 
    angle=angle/180*pi;
    r=0:0.1:2*pi+0.1;
    p=[(a*cos(r))' (b*sin(r))'];

    alpha=[cos(angle) -sin(angle)
           sin(angle) cos(angle)];

     p1=p*alpha;

    patch(cx+p1(:,1),cy+p1(:,2),color,'EdgeColor',color);
  
end
    