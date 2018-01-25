function [c,max1]= bisect(f,a,b,delta,epsilon,max1)
ya=feval(f,a);
yb=feval(f,b);
if(ya*yb>0)
    display('inapt a and b');
    return;
end

for k=1:max1
    
    yc=feval(f,c);
    if yc == 0
    break;
    
    elseif (yb*yc) > 0
        b=c;
    else
        a=c;
    end
    
    if b-a<delta
        c=a+b/2;
        break;
    end
    

end

err=abs(b-a);
if k==max1
    display('maxed out');
end