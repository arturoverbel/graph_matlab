function promedios = test_calc(obj, calc, numMinNodes, numMaxNodes, repeticiones)
    
    numScenarios = numMaxNodes-numMinNodes+1;
    promedios = zeros(1,numScenarios);
    for numNodes = numMinNodes:numMaxNodes
        w = [1 2 3 4 5 6];
        suma = 0;
        
        for caso = 1:repeticiones
            %p = int2str(numNodes) +" - " + int2str(caso)
            numNodes
            caso
            Gr = Graph_pro();
            Gr = Gr.creategraph(numNodes,0.75,w);
            
            tic;
            switch calc
                case "floyd_warshall"
                    Gr.floyd_warshall();
                case "dijkstra"
                    Gr.dijkstra();
            end
            
            time = toc;
            suma = suma + time;
            
        end
        
        promedioCalc = suma / repeticiones;
        promedios(numNodes-numMinNodes+1) = promedioCalc;
    end
end