function [t,y,z] = Spline3_Coeff(t,y)
%function to compute the z values in the cublic spline process
clear h b u v z
n=length(t)-1;
for  i=1:n
    h(i)=t(i+1)-t(i);
    b(i)=(y(i+1)-y(i))/h(i);
end
    u(1)=2*(h(1)+h(2));
    v(1)=6*(b(2)-b(1));
    
    for i=2:n
        u(i)=2*(h(i)+h(i-1))-h(i-1)^2/u(i-1);
        v(i)=6*(b(i)-b(i-1))-h(i-1)*v(i-1)/u(i-1);
    end
    
    %values of z are computed from last to first
    z(n+1)=0;   %natural cubic spline right end point
    for i=n:-1:2     %typo on book ?
        z(i)=(v(i)-h(i)*z(i+1))/u(i);
    end
    z(1)=0;     % nat. cubic spline left end point

end

