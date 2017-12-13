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