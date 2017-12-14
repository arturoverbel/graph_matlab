function [s t] = readFile(obj, nameFile)
    clc
    fileID = fopen(nameFile,'r');
    formatSpec = '%d %d';
    sizeA = [2 Inf];
    
    A = fscanf(fileID,formatSpec,sizeA);
    
    s = A(1,:);
    t = A(2,:);
    s = s + 1;
    t = t + 1;
    
    fclose(fileID);

end
