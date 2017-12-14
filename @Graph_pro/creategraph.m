function obj = creategraph(obj, totalNodes, pro_edges, weights)

    source = [];
    target = [];
    weight = [];
    
    for i = 1:totalNodes
        for k = i:totalNodes
            if i ~= k 
                p = 1 - pro_edges;
                hasEdge = va(obj, [0 1], [p pro_edges]);
                w = 0;
                if hasEdge == 1
                    probabilities = zeros(1,numel(weights));
                    probabilities = probabilities + (1/numel(weights));
                    w = va(obj, weights, probabilities);
                    
                    source = [source i];
                    target = [target k];
                    weight = [weight w];
                    
                end
                
            end
        end
    end
    
    obj.source = source;
    obj.target = target;
    obj.weight = weight;

    obj.vertex = obj.vertexes();
    
end