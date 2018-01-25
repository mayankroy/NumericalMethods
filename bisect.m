function [c,max1]= bisect(f,a,b,delta)
ya=feval(f,a);
yb=feval(f,b);
if(ya*yb>0)
    display('inapt a and b');
    return;
end
max1=1+round((log(b-a)-log(delta))/log(2));
%max1=100;
for k=1:max1
    c=a+b/2;
    yc=feval(f,c);
    if yc == 0
        a=c;
        b=c;
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

    
        
    