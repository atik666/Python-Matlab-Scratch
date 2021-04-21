function out = RunGA(problem, params)

    % Problem
    CostFunction = problem.CostFunction;
    nVar = problem.nVar;

    % Params
    MaxIt = params.MaxIt;
    nPop = params.nPop;
    pC = params.pC;
    nC = round(pC*nPop/2)*2;
    mu = params.mu;
    
    % Template for empty individuals
    empty_individual.Position= [];
    empty_individual.Cost = [];
    
    % Best solution ever found
    bestsol.Cost = inf;
    
    % Initialization
    pop = repmat(empty_individual, nPop, 1);
    for i = 1:nPop
        
       %Generate random solution
       pop(i).position = randi([0,1], 1, nVar);
       
       % Evaluate Solution
       pop(i).Cost = CostFunction(pop(i).Position);
       
       % Compare solution to best solution ever found
       if pop(i).Cost < bestsol.Cost
          bestsol = pop(i); 
       end
    end
    
    % Best Cost of iteration
    bestcost = nan(MaxIt, 1);
    
    % Main loop
    for it = 1:MaxIt
        
        % Initialize offsprings population
        popc = repmat(empty_individual, nC/2, 2);
        
        % Crossover
        for k = 1:nC/2
            % Select parents
            q = randperm(nPop);
            p1 = pop(q(1));
            p2 = pop(q(2));
            
            % Perform Corssover
            [popc(k, 1).Position, popc(k, 2).Position] = SinglePointCrossover(p1.Position, p2.Position);
        end
        
        % Convert popc to Single-Column matrix
        popc = popc(:);
        
        % Mutation
        for l = 1:nC
           
            % Perform mutation
            popc(l).Position = Mutate(popc(l).Position, mu);
            
            % Evaluate
            popc(l).Cost = CostFunction(popc(l).Position);
            
            % Compare solution to best solution ever found
            if pop(l).Cost < bestsol.Cost
                bestsol = pop(l); 
            end
        end

      
      % Merge population
      pop = [pop; popc];
      
      % Sort population
      [~, so] = sort([pop.Cost]);
      pop = pop(so);
      
      % Remove extra individuals
      pop = pop(1:nPop);
      
      % Update Best cost of iteration
      bestcost(it) = bestsol.Cost;
      
      % Display iteration Information
      disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(bestcost(it))]);
      
    end
    
    % Results
    out.pop = pop;
    out.bestsol = bestsol;
    out.bestcost = bestcost;
end