function [ pop ] = Initialization( nPop )
global VarMin
global VarMax

CostFunction=@(x) FTMH_Goalnew(x);      % Cost Function

et=[470 	630 	70  	630
    580	    770	    210  	710
    900   	690  	1020	220
    1210  	90	    1590   	0
    1220 	0	    1390   	0
    1020  	0	     270	0
    620    	0	      0	    0
    110	    0      	  0	    0
    0	    40	      0	    40
    0	    30	      0	    30
    0	    50   	  0   	50
    0	   230	      0	   230];

k1=[.6 , .6 , .7,.6];

hm = 12;
hn = 4;
demand = 0;
pos1 = [];
VarSize=[1 100];
empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];

pop=repmat(empty_individual,nPop,1);

for pppp = 1 : nPop
    
    
    while true
        
        position =unifrnd(VarMin,VarMax,VarSize);
        
        
        %% sec3
        %     pos3 = unifrnd(VarMin(97:100),VarMax((97:100)),[1 4]);
        A = sum( position (97:100) );
        pos1 = position (97:100) ;
        while A <= 12500 && A >= 16500
            pos1 = unifrnd(VarMin(97:100),VarMax((97:100)),[1 4]);
            A = sum( pos1 );
        end
        position(97:100) = pos1;
        
        demand = zeros(1,12) ;
        %% aggrigation
        
        for i = 1 :12
            for j = 1 : 4
                demand(i) = demand(i) + (et (i ,j)) * pos1(j) ;
            end
        end
        
        for i = 0 : 11
            X1(i+1) = sum ( position( (4*i + 1) : (4*i + 4) ) );
            X2(i+1) = sum ( position( (48 + (4*i) + 1 ) : (48 + (4*i) + 4 ) ) ) ;
        end
        
        sw = true ;
        for i = 1 : 12
            if X1(i) + X2(i) - demand(i) > 0 
                sw = false;
                break
            end
        end
        
        if ~sw
            continue
        end
        
        
        %%
        niyaz=[];
        gama = zeros (1,4);
        jamex = 0;
        for j=1:4
            jamex = 0;
            for i=1:12
                jamex =  jamex+ position((i-1)*hn+j)+ position(hm*hn+(i-1)*hn+j);
            end
            niyaz(j) = sum ( et (:,j)) * position ( 2*hm*hn + j);
            gama(j)  = k1(j).*( jamex ./ niyaz(j) );
            
        end
        %%
        sw = true;
        for j = 1 :4
             if gama(j) < 0.4
                 sw = false;
                 break
             end
        end 
        
         if ~sw
            continue
         end
        
        pop(pppp).Position = position;
        pop(pppp).Cost=CostFunction(pop(pppp).Position);
        break;
        
    end
end





end

