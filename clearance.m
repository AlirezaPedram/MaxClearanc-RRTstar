function clearance= clearance(x, obs_x, bound)

% compute the clerance of point x 

% clearance from obstacles
cl_obs_list = sqrt( sum( (x - obs_x ).^2, 1) );

cl_obs = min(cl_obs_list);

d_1 = abs(x(1)-bound(1).x(1));
d_2 = abs(x(1)-bound(1).x(2));
d_3 = abs(x(2)-bound(2).x(1));
d_4 = abs(x(2)-bound(2).x(2));

% clearance from boundaries

cl_bound= min([d_1, d_2, d_3, d_4]);

clearance = 1/min([cl_obs, cl_bound]);
end