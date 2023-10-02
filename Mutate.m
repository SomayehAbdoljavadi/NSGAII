function y=Mutate(x,mu,sigma)
global VarMin
global VarMax
nVar=numel(x);

nMu=ceil(mu*nVar);
i = 1;
while true
    i = i+1;
    indices = randsample(nVar,nMu);

    y=x;


    for i = 1 : size(indices,2)
        j = indices(i);
        while true
            y(j) = x(j) + sigma(j)*randn(size(j));
            if y(j) >= VarMin(j) && y(j) <= VarMax(j)
                break
            end
        end
    end
    if chekqeid(y)
        break
        
    end
end
end