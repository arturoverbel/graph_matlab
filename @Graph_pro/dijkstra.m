
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