function [value, min_cl] = dist_ig_mat2( x1, x2_mat, cl_min1, value1, obs_x, bound,alpha)
% This Function computes the value and min_clerance of nodes in x2_mat 
% if the parent node is  (x1, cl_min1, value1)

d_cont = sqrt( sum( (x2_mat - x1 ).^2, 1) );
num_dcont = numel(d_cont);

value = zeros(1, num_dcont);

min_cl = zeros(1, num_dcont);

for j = 1:num_dcont

    cl_j = clearance(x2_mat(:,j), obs_x, bound);

    min_cl(1,j) =  max([cl_j, cl_min1]);

    value(1,j) = value1 + d_cont(j) + (alpha) * min_cl(1,j);
end

end