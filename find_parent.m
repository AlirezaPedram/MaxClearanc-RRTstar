function [parent, min_clearance,  value, nbor_issue ] =...
    find_parent( x,  node, radius, obs_x, cell_size, bound, num_props, prop, In_list_ID, nearest, alpha)
% find the parent for the sampled node x
% parent: ID of the parent node
% nbor_issue = true means no parent is found 

% Definition and initial values for outputs
nbor_issue = 0;
parent = 0;
value = 0;
min_clearance = 0;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Check if the transition from the nearest node is collision-free
issue_flag = psuedo_obs_check_line_oct(x, node(nearest), obs_x, cell_size, num_props, prop);

% computes the value if nearest is the parent of sampled x
if issue_flag==0    
dim = numel(x);
x_nearest_vec = [node(nearest).x].';
x_nearest_mat = reshape( x_nearest_vec, [dim, numel(x)/dim]);


cl_nearest_mat = [node(nearest).min_clearance];
value_nearest_mat =  [node(nearest).value];

[value, min_cl] = dist_ig_mat( x_nearest_mat, cl_nearest_mat, value_nearest_mat, x.', obs_x, bound, alpha);

parent = nearest;
min_clearance = min_cl;

value=value.';
end


% check if nearest is the only neighbor
Is_only_neibor_ID = false;

[nbors_ID, value_xk2node_i, min_cl_i] =...
    find_neighbors( x, node, radius, In_list_ID, Is_only_neibor_ID, obs_x, bound, alpha);



if isempty(nbors_ID) == 1 && issue_flag==1
   nbor_issue = 1; % There is no neighbors
else
%%%%%%%%%%%%%%%%%%%%%%% Collision Check here!! %%%%%%%%%%%%%%%%%%%%%%%%
% Here, we discretize the path from node ii-1 to node ii into ellipses with the number of "num_props".
% Then, calculate boundinb boxes (# is "num_props") which surround those ellipses. 
% Finally, run "obstacle_check" for these bounding boxes. 
    num_nbor = numel(nbors_ID);
    issue_flag = true(num_nbor, 1);

    for jj = 1:num_nbor
        node_jj = node(nbors_ID(jj));
        [issue_flag(jj)] = psuedo_obs_check_line_oct(x, node_jj, obs_x, cell_size, num_props, prop);

    end

    % find neighboring nodes which don't have any issues.
    In_list_no_issue_ID = nbors_ID(~issue_flag);             

    if isempty(In_list_no_issue_ID) == 1
        nbor_issue = 1; % There is no feasible neighbors
    else


    
        val =   value_xk2node_i(~issue_flag).';
        min_cl_i_no_issue= min_cl_i(~issue_flag).';

        
        [val_min, k_min] = min(val);

        parent_ID = In_list_no_issue_ID(k_min);
        
        parent = parent_ID;
        min_clearance = min_cl_i_no_issue(k_min);
        value = val_min;
    end
    
end

end

