function x = scale_rrt_point(dist,radius,x,node,nbor)
% Check if the node (x,P) is within the predefined distance (radius) of the 
% neighbor node "nbor"
% if not it is not whithin "raduis" distance, this function scales the node
% dist: initial distance to "nbor"

if dist> radius
    
    % % scale the Euclidean location (no covariance change),       
    nbor_x = node(nbor).x;
    dx = (x - nbor_x) .* (radius/dist);
    x = nbor_x + dx;
    

end
end 
