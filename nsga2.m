clc;
clear;
close all;



%% Problem Definition
global VarMin
global VarMax

CostFunction=@(x) FTMH_Goalnew(x);      % Cost Function
nVar=100;             % Number of Decision Variables
Itthreshold = 500;
VarSize=[1 nVar];   % Size of Decision Variables Matrix
% VarMax=[2820000	3000000	420000	3000000	3000000	3000000	1260000	3000000	3000000	3000000	3000000	1760000	3000000	540000	3000000	0	3000000	0	3000000	0	3000000	0	1620000	0	3000000	   0	0	0	660000	0	0	0	0	240000	0	320000	0	180000	0	240000	0	300000	0	400000	0	1380000	0	1760000	2820000	3000000	420000	3000000	3000000	3000000	1260000	3000000	3000000	3000000	3000000	1760000	3000000	540000	3000000	0	3000000	0	3000000	0	3000000	0	1620000	0	3000000	   0	0	0	660000	0	0	0	0	240000	0	320000	0	180000	0	240000	0	300000	0	400000	0	1380000	0	1760000	5000 10000	600	4000];
VarMin=[0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	3000	7000	200	2000];
% VarMax8esfand =[1880000,6300000,42000,1890000,2320000,7700000,126000,2130000,3600000,6900000,612000,660000,4840000,900000,954000,0,4880000,0,834000,0,4080000,0,162000,0,2480000,0,0,0,440000,0,0,0,0,400000,0,120000,0,300000,0,90000,0,500000,0,150000,0,2300000,0,690000,626666.666666667,900000,14000,630000,773333.333333333,900000,42000,710000,900000,900000,900000,220000,1000000,300000,318000,0,1000000,0,278000,0,1000000,0,54000,0,826666,0,0,0,146666.666666667,0,0,0,0,133333.333333333,0,40000,0,100000,0,30000,0,1000000,0,50000,0,766666.666666667,0,230000,4000,10000,600,3000];
% VarMax=[2820000	3000000	420000	3000000	3000000	3000000	1260000	3000000	3000000	3000000	3000000	1760000	3000000	540000	3000000	0	3000000	0	3000000	0	3000000	0	1620000	0	3000000	   0	0	0	660000	0	0	0	0	240000	0	320000	0	180000	0	240000	0	300000	0	400000	0	1380000	0	1760000	2820000	3000000	420000	3000000	3000000	3000000	1260000	3000000	3000000	3000000	3000000	1760000	3000000	540000	3000000	0	3000000	0	3000000	0	3000000	0	1620000	0	3000000	   0	0	0	660000	0	0	0	0	240000	0	320000	0	180000	0	240000	0	300000	0	400000	0	1380000	0	1760000	5000	10000	600	3000];
VarMax = [1880000	6300000	42000	1890000	2320000	7700000	126000	2130000	3600000	6900000	612000	660000	4840000	900000	954000	0	4880000	0	834000	0	4080000	0	162000	0	2480000	0	0	0	440000	0	0	0	0	400000	0	120000	0	300000	0	90000	0	500000	0	150000	0	2300000	0	500000	500000	500000	14000	500000	500000	500000	42000	500000	500000	500000	204000	220000	500000	300000	318000	0	800000	0	278000	0	800000	0	54000	0	826666.6667	0	0	0	146666.6667	0	0	0	0	133333.3333	0	40000	0	100000	0	30000	0	166666.6667	0	50000	0	766666.6667	0	230000	4000	10000	600	3000
    ];
% VarMin=[470000,1575000,10500,472500,580000,1925000,31500,532500,900000,1725000,153000,165000,1210000,225000,238500,0,1220000,0,208500,0,1020000,0,40500,0,620000,0,0,0,110000,0,0,0,0,100000,0,30000,0,75000,0,22500,0,125000,0,37500,0,575000,0,125000,125000,125000,3500,125000,125000,125000,10500,125000,125000,125000,51000,55000,125000,75000,79500,0,200000,0,69500,0,200000,0,13500,0,206666.666675000,0,0,0,36666.6666750000,0,0,0,0,33333.3333250000,0,10000,0,25000,0,7500,0,41666.6666750000,0,12500,0,191666.666675000,0,57500,3000,7000,200,2000];
% Number of Objective Functions
nObj=numel(CostFunction(unifrnd(VarMin,VarMax,VarSize)));


%% NSGA-II Parameters

MaxIt=15000;      % Maximum Number of Iterations

nPop = 150;       % Population Size

pCrossover=0.8;                         % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.4;                          % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

muu= [ 0.005 ];                    % Mutation Rate

sigma=0.1*(VarMax-VarMin);  % Mutation Step Size


%if exist('images') ~= 7
mkdir('images');
mkdir('workspace');
mkdir('fitfunc');

%end
path = 'images/';
pathW = 'workspace/';
pathF = 'fitfunc/';


%% Initialization
empty_individual.Position=[];
empty_individual.Cost=[];
empty_individual.Rank=[];
empty_individual.DominationSet=[];
empty_individual.DominatedCount=[];
empty_individual.CrowdingDistance=[];



for runCounter = 1 : 1
    mu  = muu(runCounter);
    %     empty_individual.Position=[];
    %     empty_individual.Cost=[];
    %     empty_individual.Rank=[];
    %     empty_individual.DominationSet=[];
    %     empty_individual.DominatedCount=[];
    %     empty_individual.CrowdingDistance=[];
    %
    %     pop=repmat(empty_individual,nPop,1);
    %
    %     for i=1:nPop
    %
    %         pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    %
    %         pop(i).Cost=CostFunction(pop(i).Position);
    %
    %     end
    
    pop = Initialization(nPop);
    % Non-Dominated Sorting
    [pop F]=NonDominatedSorting(pop);
    
    % Calculate Crowding Distance
    pop=CalcCrowdingDistance(pop,F);
    
    % Sort Population
    [pop F]=SortPopulation(pop);
    
    
    %% NSGA-II Main Loop
    
    fitnessFunc1 = zeros(1,MaxIt);
    fitnessFunc2 = zeros(1,MaxIt);
    
    obj4 = [];
    %    MaxIt = 30000
    for it = 1578 : MaxIt
        tic
        %         Marhale = MaxIt / 3;
        %         if it <= Marhale
        % %             pCrossover=0.3;
        % %             pMutation=0.9;
        %             mu = 0.1;
        %         elseif it <= 2*Marhale
        % %             pCrossover=0.5;
        % %             pMutation=0.6;
        %             mu=0.05;
        %         else
        % %             pCrossover=0.8;
        % %             pMutation=0.3;
        %             mu=0.001;
        %         end
        
        % Crossover
        popc=repmat(empty_individual,nCrossover/2,2);
        for k=1:nCrossover/2
            
            i1=randi([1 nPop]);
            p1=pop(i1);
            
            i2=randi([1 nPop]);
            p2=pop(i2);
            
            [popc(k,1).Position , popc(k,2).Position]=Crossover(p1.Position,p2.Position);
            
            popc(k,1).Cost=CostFunction(popc(k,1).Position);
            popc(k,2).Cost=CostFunction(popc(k,2).Position);
            
        end
        popc=popc(:);
        
        % Mutation
        popm=repmat(empty_individual,nMutation,1);
        for k=1:nMutation
            
            i=randi([1 nPop]);
            p=pop(i);
            
            popm(k).Position=Mutate(p.Position,mu,sigma);
            
            popm(k).Cost=CostFunction(popm(k).Position);
            
        end
        
        % Merge
        pop=[pop
            popc
            popm];
        
        % Non-Dominated Sorting
        [pop F]=NonDominatedSorting(pop);
        
        % Calculate Crowding Distance
        pop=CalcCrowdingDistance(pop,F);
        
        % Sort Population
        [pop F]=SortPopulation(pop);
        
        % Truncate
        pop=pop(1:nPop);
        
        % Non-Dominated Sorting
        [pop F]=NonDominatedSorting(pop);
        
        % Calculate Crowding Distance
        pop = CalcCrowdingDistance(pop,F);
        
        % Sort Population
        [pop F]=SortPopulation(pop);
        
        % Store F1
        F1=pop(F{1});
        
        % Show Iteration Information
        %disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
        %miyangine ahdafe f1 in every iteration(1)
        summ1 = [] ;
        cost = [] ;
        for kkk = 1 : size(F1,1)
            summ1(kkk) = sum( F1(kkk).Cost(:) );
            cost = [cost ; F1(kkk).Cost] ;
            
        end
        localVar = CostNormalization (cost);
        fitnessFunc1(it) = mean(mean(localVar));
        
        
        %     cost=CostNormalization (cost);
        
        %     if isempty(cost)
        %         continue
        %     end
                cost(:,1) = cost (:,1)*(-1) ;
                cost(:,4) = cost (:,4)*(-1)  ;
        
        obj4(it) = mean(real(cost(:,4)));
        
        fig = figure
        plotmatrix(real(cost));
        saveas(fig,[path 'F1-' num2str(it) '-mu=' num2str(mu)  '.jpg']);
        title(['Optimal Pareto Front' ]);
        saveas(fig,[path 'F1-' num2str(it) '-mu=' num2str(mu) '.fig']);
        
        close all
        % ------    converge
        tempVar = [] ;
        tempVar = [tempVar, pop.CrowdingDistance];
        tempVar = tempVar( find(tempVar ~= Inf ) );
        %tempVar = tempVar./ max(tempVar);
        DL(it) = max( tempVar );
        
        DLBar = mean(DL);
        zigm(it) = sqrt( mean( (DL - DLBar).^2 ) );
        
        save('sigma.mat','zigm');
        
        %     if it > Itthreshold
        %         s = sum(zigm(end-Itthreshold+1 : end) > 0.05) ;
        %         if s == 0
        %             break;
        %         end
        %     end
        
        % Show Iteration Information
        disp(['Iteration ' num2str(it) ': Number of F1 Members = ' num2str(numel(F1))]);
        save([ 'fitnessFunc1-mu=' num2str(mu) '.mat'] ,'fitnessFunc1')
        
        save([pathW 'workspace' num2str(it) '-mu=' num2str(mu) '.mat' ] )
        %        save([pathW 'workspace-mu=' num2str(mu) '.mat' ] )
        
        toc
    end
end
fig = figure
plot([1:MaxIt] , fitnessFunc1 ,'--r')
title('FitnessFunction')
saveas(fig,'Fitfunc.jpeg')
save([pathF 'fitnessfunc.mat', 'fitnessFunc1']);
saveas(fig,'Fitfunc.fig')
save( [ pathF 'simpleCovMeasure-' num2str(MaxIt) '-' num2str(nPop) '-' num2str(pCrossover) ...
    '-' num2str(pMutation) '.mat'] ,'fitnessFunc1');



%% Results

nRep=numel(F1);
PP=zeros(nRep,4);
for i=1:nRep
    PP(i,:)=F1(i,1).Cost;
end





