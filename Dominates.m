function b=Dominates(x,y)

    if isstruct(x)
        x=x.Cost;
    end

    if isstruct(y)
        y=y.Cost;
    end
    
%     b = 0 ;
%     
%     if x(1) <= y(1) && abs(x(2)) <= abs(y(2)) && abs(x(3)) <= abs(y(3)) && x(4) <= y(4)
%         if x(1) < y(1) || abs(x(2)) < abs(y(2)) || abs(x(3)) < abs(y(3)) || x(4) < y(4)
%             b = 1;
%         end
%         
%     end
   b = all( x <= y ) && any( x < y ) ;
    
    %b = all(abs(x) <= abs(y) ) && any( abs(x) < abs(y) ) ;

end