function [value] = Spline3_Eval(t,y,z,x)

n=length(t)-1;
for i=n:-1:1 
    if x-t(i)>=0
        break
    end   
end
h=t(i+1)-t(i);
temp=z(i)/2+(x-t(i)).*(z(i+1)-z(i))/(6*h);

temp=-(h/6).*(z(i+1)+2*z(i))+(y(i+1)-y(i))/h+(x-t(i)).*(temp);

value=y(i)+(x-t(i)).*(temp);

end