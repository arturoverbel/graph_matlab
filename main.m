%% First example
clc;
clear;
s = [1 2 2 3 ];
t = [2 3 4 4 ];
w = [1 2 4 1 ];

G = graph(s,t, w);
%p = plot(G);
%labeledge(p,1:numedges(G),w);

%weights_pro(3,4,s,t,w);

Gr = Graph_pro(s,t,w);
Gr = Gr.setUndirected(0);
%Gr.dijkstra()
Gr.floyd_warshall()
%dijkstra(G)
%floyd_warshall(G)

%% Second example
clc;
names = {'A', 'B', 'C', 'D', 'E'};
s = [1 1 2 2 3 4];
t = [2 4 3 5 5 5];
w = [6 1 5 2 5 1];

G = digraph(s,t, w, names);
%p = plot(G);
%labeledge(p,1:numedges(G),w);


%vertexes(s,t)
Gr = Graph_pro(s,t,w);
Gr = Gr.setUndirected(1);
Gr.dijkstra()
Gr.floyd_warshall()

%dijkstra(G)
%floyd_warshall(G)
%% Anohter
clc;
s = [10 20 20 30 ];
t = [20 30 20 40 ];
w = [1 2 4 1 ];

G = graph(s,t, w);
%p = plot(G);
%labeledge(p,1:numedges(G),w);

Gr = Graph_pro(s,t,w);
Gr = Gr.setUndirected(0);
Gr.dijkstra()
Gr.floyd_warshall()

%dijkstra(G)
%floyd_warshall(G)
%% Third example
clc;
s = [1 2 2 3 4];
t = [3 1 3 4 2];
w = [-2 4 3 2 -1];

G = digraph(s,t, w);
p = plot(G);
labeledge(p,1:numedges(G),w);

dijkstra(G)
floyd_warshall(G)