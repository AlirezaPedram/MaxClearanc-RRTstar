function obstacle_issue = obstacle_check_grid(x, obs_x, cell_size)
%check if node x is far enough from obstacle grid obs_x 
obstacle_issue = false;

% since cells has an nonzero_length we add a heuristic safety margin
for ii=1:length(obs_x)
   dist_x= abs((x(1)-obs_x(1,ii)));
   dist_y= abs((x(2)-obs_x(2,ii)));
   
   if dist_x <= cell_size && dist_y <= cell_size  
      obstacle_issue = true;
      break;
   end  
   
end


end