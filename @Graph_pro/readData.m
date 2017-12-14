
function obj = readData(obj, filename)
    [s t] = readFile(obj, filename);
    
    obj.source = s;
    obj.target = t;
    obj.weight = ones(1,numel(s));

    obj.vertex = obj.vertexes();
    
end