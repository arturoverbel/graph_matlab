classdef Graph_pro
    % Graph pro - Proyect
    %   Multiples functions and calculs for graph from file
    
    properties
        source; % List sources vertexes e.g: [1 2 2 3]
        target; % List target vertexes e.g:  [2 3 4 4] 
        weight; % Weight for each edge e.g:  [1 2 4 1]
        vertex; % List all vertex.
        
        undirected = 0; % Indicate Type graph. 1 - One Directed. 0 - Two directed.
    end
   
    methods
        
        function obj = Graph_pro(source, target, weight)
            % Load source and target. Weight is optional
            
            switch nargin
                case 2
                    obj.source = source;
                    obj.target = target;
                    
                    obj.weight = ones(1,numel(source));
                    
                    obj.vertex = obj.vertexes();
                case 3
                    obj.source = source;
                    obj.target = target;
                    obj.weight = weight;
                    
                    obj.vertex = obj.vertexes();
            end
            
            
        end
        
        
        
        
        % Shortest Path
        dist = dijkstra(obj);
        dist = floyd_warshall(obj);

        % Utils
        vertex = vertexes(obj);
        weight = getWeight(obj, u, v);
        
        % Create graph
        y = va(obj, x,p,filas,columnas);
        obj = creategraph(obj, totalNodes, pro_edges, weights);
        
        
        % Data
        [s t] = readFile(obj, filename);
        obj = readData(obj, filename);
        
        %Test
        promedios = test_calc(obj, calc, numMinNodes, numMaxNodes, repeticiones);
        
        function obj = setUndirected(obj,value)
            obj.undirected = value;
        end
        
    end
   
   
end