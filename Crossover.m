function [y1 y2] = Crossover(x1,x2)

i = 1 ;
while true
    i = i + 1 ;
    if i == 100000000
        y1 = x1;
        y2 = x2;
        break
    end
    alpha=rand(size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
    if chekqeid(y1) && chekqeid(y2)
        break
    end
    
end

end