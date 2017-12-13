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