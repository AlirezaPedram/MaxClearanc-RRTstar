function [node, remove_ID] = branch_and_bound_2D(node, path, In_list_ID, i, ini_st, dim, obs_x, bound, alpha)
% This function implement branch-and-bound technique
% This function removes the nodes that cannot be on the optimal path
% node: RRT* structure
% path: shortest path to the target region
% In_list_ID: list of active nodes
% alpha: weight on information cost
% R: noise power
% remove_ID: list of nodes which are needed to be removed


% The position and variance of the last node (goal) on the optimal path
term_pos = node(path(1)).x;
%term_P = node(path(1)).P;

In_list_i_ID = [In_list_ID; i];

pos_list = [node(In_list_i_ID).x].';
pos_list = reshape( pos_list, [dim, numel(pos_list)/dim]);

%P_list = [node(In_list_i_ID).P];
cl_list = [node(In_list_i_ID).min_clearance];
value_list =  [node(In_list_i_ID).value];


% For all nodes, calculate the distance to the above goal node
[node_value_end,~] = dist_ig_mat( pos_list, cl_list, value_list,  term_pos.', obs_x, bound, alpha);

% Current the best path
path_len = node(path(1)).value;

% Calculate each node's path length which assumes that it has a direct path 
% with the goal node
min_len = node_value_end.';%+ [node( In_list_i_ID ).value].';


% If min_len is longer than current best path, remove that path
remove_ID = In_list_i_ID(min_len > path_len);
remove_ID(remove_ID == path(1)) = [];


for k = 1:length(remove_ID)
    % The ID of node we will remove in this loop
    node(remove_ID(k)).removed = true;
    node(remove_ID(k)).children = ini_st;
end

