function y = CostNormalization (x)

y=[];

if size(x,1) < 3
    return
end

Min = min (x);
Max = max (x);

x1 = [] ;
for i = 1 : 4
    MatrisMin =repmat (Min(i), size (x,1),1);
    x1 = [ x1 , x(:,i) + (-1)* sign(Min(i)) * abs(MatrisMin) ];
end

%     MatrisMax =repmat (Max, size (x,1),1);
D = Max - Min;
%x1 = x + abs(MatrisMin);

try
    for k = 1: size (x,2)
        y = [y ,( x1(:,k)/D(k))];
    end
catch
    stop = 0 ;
end
end
