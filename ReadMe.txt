===============================================================================================================================
Basic information
First, create a empty folder "data", where the data will be saved.
By running "main.m", you can start Maximum clerance RRT* path-planning algorithm MC-RRT*. 
===============================================================================================================================

Codes related with the Path-planning simulation:

main.m: The main function to run MC-RRT*

Map_gen.m: generate a sample map environment called "quad"

clerance.m: It computes the clerance of nodes

sample_x_randomly.m: It samples x randomly 
sample_polyshape_check.m: samples x outside of all obstacle. It is used in sample_x_randomly.m


dist_ig_mat.m & dist_ig_mat2.m: The functions which calculate the distance. The difference between these two functions is whether we want to measure the distance from the set of nodes to one node, or from one node to the set of nodes.
branch_and_bound_2D.m: It conducts branch and bound algorithm


find_nearest.m: It finds the nearest nodes 
find_neighbors.m: It finds the set of neighboring nodes
find_parent.m: find parent of a node from the RRT* tree
find_optimal_path_2D.m: The function which find the optimal path from the existing nodes

******** The function related for obstacle checking ********
obstacle_check_grid.m: check if node x is far enough from obstacle grids 

psuedo_obs_check_line_oct.m: It checks if a collision with obstacles during the transition between nodes occurs. 
psuedo_obs_check_line2_oct.m: The same with the above 


===============================================================================================================================
Codes related with the plotting
plot_for_paper_quad: This function plots results for "qaud" enviroment
obstacle_quad.m: This function saves information of obstacles and used in plot_for_paper_quad
plot_path_cost: It plots the path length as a function of number of samples. It should be run right after main.m
===============================================================================================================================

