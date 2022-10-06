function [value, min_cl] = dist_ig_mat( x1_mat, cl_mat, value_mat, x2, obs_x, bound, alpha)
% This Function computes the value and min_clerance of node x_2
% for any of possible parent node (x_mat, cl_mat,value_mat)

d_cont = sqrt( sum( (x2 - x1_mat ).^2, 1) );

num_dcont = numel(d_cont);

value = zeros(1, num_dcont);

min_cl = zeros(1, num_dcont);

cl=clearance(x2, obs_x, bound);

for j = 1:num_dcont
    
    min_cl(1,j) =  max([cl, cl_mat(j)]);

    value(1,j) = value_mat(j) + d_cont(j) + (alpha)* min_cl(1,j);
end

end