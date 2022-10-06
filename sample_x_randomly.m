function [x, nearest] = sample_x_randomly(bound, node, In_list_ID, radius_min, radius,  obs_x, cell_size)
% This funtion samples a node x
% Step 1: a "scaled" x  is sought such that x is not inside any obstacle

%% Step 1: Samples until it finds a x such that it is outside of all obstacle regions 
obstacle_issue = 1;

while  obstacle_issue ~= 0
[x, obstacle_issue, nearest] = sample_polyshape_check(bound,node,In_list_ID,radius_min, radius, obs_x, cell_size);
end
% nearest is parent of the sampled, sclaed (x,P)

end

