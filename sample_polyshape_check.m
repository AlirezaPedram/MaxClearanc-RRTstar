function [x, obstacle_issue, nearest] = sample_polyshape_check(bound, node, In_list_ID, radius_min, radius, obs_x, cell_size)
% This Function samples and scales a node x such that hat x is not inside any obstacle


% This works only for 2D cases
x = zeros(1,2);

%% Generate x
ed = 0;

while ed < radius_min % This checks the distance to the nearest node is greater than radius_min
    
    for jj = 1:2
        
        % Take samples in a bounded region to generate x
        x(jj) = bound(jj).x(1) + (bound(jj).x(2)-bound(jj).x(1))*rand;
       
    end
    
    % Finds  nearest: the nearest node in the tree and
    % ed: the distance (Euclidean+Forbenious) from nearest to 
    % generated sample for scaling  
    [nearest,ed] = find_nearest(node, In_list_ID, x); 
 end
%% Scales samples (x,P) toward its parent in th tree
x = scale_rrt_point(ed,radius,x,node, nearest); % scales the sampled point


%% This section checks if the sampled point x is inside any obstacle
obstacle_issue = false;

for ii=1:length(obs_x)
   dist_x= abs((x(1)-obs_x(1,ii)));
   dist_y= abs((x(2)-obs_x(2,ii)));
   
   if dist_x <= cell_size && dist_y <= cell_size  
      obstacle_issue = true;
      break;
   end  
   
end

end

