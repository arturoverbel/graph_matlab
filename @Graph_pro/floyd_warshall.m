
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