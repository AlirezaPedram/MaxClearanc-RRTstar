function [ neighbor_ID, value_xk2node_i, min_cl_i] =...
    find_neighbors( x, node, radius_nbor, In_list_no_issue_ID, Is_only_neibor_ID, obs_x, bound, alpha)
%FIND_NEIGHBORS 
% finds the neighbors of x on the node(tree), for which the distance to
% x is lower than radius_nbor


dim = numel(x);

x_neighbor_vec = [node(In_list_no_issue_ID).x].';
% Size of x_nei_mat: dim * number of neighbors
x_nei_mat = reshape( x_neighbor_vec, [dim, numel(x_neighbor_vec)/dim]);

% Size of P_nei_mat: dim * (dim * number of neighbors)
cl_nei_mat = [node(In_list_no_issue_ID).min_clearance];
value_nei_mat = [node(In_list_no_issue_ID).value];

% Row vector which has Euclidean distance between node ii and each
% neiboring nodes
dne = sqrt( sum( (x.' - x_nei_mat).^2, 1) );



% compute the distance
Is_neighbor = dne < radius_nbor; % compare the distance with radius of neighborhood


% find neibors
neighbor_ID = In_list_no_issue_ID (Is_neighbor);


 
if Is_only_neibor_ID
   value_xk2node_i =[];
    min_cl_i = [];
else
    
    % Row vector which has distance information from noissue_flag nodes to node ii
     [value_xk2node_i, min_cl_i] = dist_ig_mat( x_nei_mat, cl_nei_mat, value_nei_mat, x.', obs_x, bound, alpha);

    value_xk2node_i = value_xk2node_i(Is_neighbor); % total cost
    min_cl_i=min_cl_i(Is_neighbor);
end
