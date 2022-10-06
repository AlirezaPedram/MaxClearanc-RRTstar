function issue_flag = psuedo_obs_check_line2_oct(node_ii, node_jj, obs_x, cell_size, num_props, prop)
% This function detemines if the transition from the node_ii to node_jj is
% collison-free or not
% 0 (=false) means the transition is collision free
% 1 (=true) means collision happens
% Inputs of this function are
% node_ii: The recently added node
% node_jj: The existing nodes information (See the beginning of "main.m for more information")
% obstacle_edge: The information of obstacles



%% Initialize Issue_flag
issue_flag = false;

% initial and final position of connecting line segment
x0 = node_ii.x;
xF = node_jj.x;


%% Check collisions by using the inscribing octagon or rectangle at intermediate points

move_vec = (xF - x0)/(num_props+1);

for kk = 1:num_props+1
    prop(kk).x = x0 + move_vec*kk;
end


for kk=1:length(prop)
    
        if obstacle_check_grid(prop(kk).x, obs_x, cell_size)
            issue_flag = true;
            return
        end
end

end

