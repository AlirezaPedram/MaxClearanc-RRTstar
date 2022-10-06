function [ j_min, d_min ] = find_nearest( node, In_list_ID, x )
% Find the nearest node from nodes in the tree (In_list_ID) to the 
% node x and the associated minimum distance

% reshaping
x_node = reshape([node(In_list_ID).x], [2, numel(In_list_ID)]).';

%Euclidean distance
d = sqrt( sum( (x_node - x).^2, 2) );


dne = d;

% Find the minimum 
[d_min, j_min] = min(dne);

