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
            obj.source = source;
            obj.target = target;
            obj.weight = weight;
            
            obj.vertex = obj.vertexes();
        end
        
        
        
        
        % Shortest Path
        dist = dijkstra(obj);
        dist = floyd_warshall(obj);

        % Utils
        vertex = vertexes(obj)
        weight = getWeight(obj, u, v)
        
        function obj = setUndirected(obj,value)
            obj.undirected = value;
        end
        
    end
   
   
end