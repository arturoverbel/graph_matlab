classdef Graph_pro
    properties
        source;
        target;
        weight;
        vertex;
        
        undirected = 0;
    end
   
    methods
        
        function obj = Graph_pro(source, target, weight)
            obj.source = source;
            obj.target = target;
            obj.weight = weight;
            
            obj.vertex = obj.vertexes();
        end
        
        
        function dist = dijkstra(obj)

            totalVertex = numel(obj.vertex);

            dist = zeros(totalVertex,totalVertex);
            dist(:) = Inf;

            for oneNode = 1:totalVertex

                Q = 1:totalVertex;
                dist(oneNode,oneNode) = 0;
                while numel(Q) ~= 0

                    [~, l] = min( dist(oneNode,Q) );
                    vIndex = Q(l);
                    vVertex = obj.vertex(vIndex);

                    Q = Q(Q~=vIndex);

                    %Get Neighbors
                    N = obj.target( find(obj.source==vVertex) );
                    if obj.undirected == 0
                        N = [N obj.source( find(obj.target==vVertex) ) ];
                    end
                    
                    for k = 1:numel(N)
                        uVertex = N(k);
                        uIndex = find(obj.vertex==uVertex);
                        
                        w = obj.getWeight(uVertex,vVertex);

                        alt = dist(oneNode,vIndex) + w;
                        if alt < dist(oneNode,uIndex)
                            dist(oneNode,uIndex) = alt;
                        end
                    end
                end
            end
        end
        
        
        function dist = floyd_warshall(obj)

            totalVertex = numel(obj.vertex);
            dist = zeros(totalVertex,totalVertex);
            dist(:) = Inf;

            for k = 1:totalVertex+1:totalVertex*totalVertex
                dist(k) = 0;
            end
            
            for k = 1:numel(obj.source)
                
                w = obj.weight(k);
                uIndex = find(obj.vertex==obj.source(k));
                vIndex = find(obj.vertex==obj.target(k));
                
                dist( uIndex, vIndex ) = w;
                if obj.undirected == 0
                    dist( vIndex, uIndex ) = w;
                end
            end

            for k = 1:totalVertex
                for i = 1:totalVertex
                    for j = 1:totalVertex

                        ij = dist(i,j);
                        ik = dist(i,k);
                        kj = dist(k,j);

                        if ij > ik + kj
                            dist(i,j) = ik +kj;
                        end

                    end
                end
            end
        end

        
        
        
        function vertex = vertexes(obj)
            search = [obj.source obj.target];
            vertex = [];

            for i = 1:numel(search)
                k = find(vertex==search(i));
                if numel(k) == 0
                    vertex = [vertex search(i)];
                end
            end
        end
        
        function weight = getWeight(obj, u, v)
            weight = NaN;
            indexW = intersect(find(obj.source==v),find(obj.target==u));
            if ( isempty(indexW) )
                
                if obj.undirected == 0
                    indexW = intersect(find(obj.target==v),find(obj.source==u));
                    if ( isempty(indexW) )
                        weight = 0;
                    end     
                else
                    weight = 0;
                end 
            end
            if isnan(weight)
                weight = obj.weight( indexW(1) );
            end
        end
        
        function obj = setUndirected(obj,value)
            obj.undirected = value;
        end
        
    end
   
   
end