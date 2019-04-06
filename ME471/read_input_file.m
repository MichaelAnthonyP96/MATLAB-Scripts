%read_input_file Matlab function
function [n_node, n_elem, N,   E,   F,   C] = read_input_file(filename) 
%=========================================================================== 
% This function can be used to read input files for PA#3, that is, input  
% files for planar truss structures. It should work without modifications. 
%
% This function works by using the built-in Matlab function fscanf to read 
% through the input file and extract its data. These data are then assigned 
% to variables which are passed out of the function for use in your FEA code. 
%
% If you want to write your own input file and read it in with this 
% function, you must carefully follow the format specified in PA#3 on the  
% first page of the assignment, otherwise this code will not work correctly. 
% 
% Input: filename is a Matlab string specifying the input file you want to  
%        use. Example: read_input_file('class_problem.txt') 
% Output: n_node is the number of nodes in the truss 
%         n_elem is the number of truss elements 
%         N is the node data. Each row contains [node#, x, y] 
%         E is the element data. Each row contains [elem#, node_i, ... 
%              node_j, area, modulus] 
%         F is the node force data. Each row contains [node#, F_x, F_y] 
%         C is the node constraint data. Each row contains [node#, x?, ... 
%              y?, C_x, C_y] where x? specifies if the node is constrained in 
%              the x direction, and C_x gives the constrained value 
%=========================================================================== 
% Open the file for reading. 
fid = fopen(filename,'r'); 
% Get the first line which defines the problem sizes. 
first_line = fscanf(fid,'%i',4); 
n_node = first_line(1);  n_elem = first_line(2); 
n_force = first_line(3);  n_constraint = first_line(4); 
% Read the node data. 
N = zeros(n_node, 3); 
for i = 1:n_node 
    N(i,1) = fscanf(fid, '%i', 1); N(i,2:3) = fscanf(fid, '%g', 2); 
end 
% Read the element data. 
E = zeros(n_elem, 5); 
for i = 1:n_elem 
    E(i,1:3) = fscanf(fid, '%i', 3); E(i,4:5) = fscanf(fid, '%g', 2); 
end 
% Read the force data. 
F = zeros(n_force, 3); 
for i = 1:n_force 
    F(i,1) = fscanf(fid, '%i', 1); F(i,2:3) = fscanf(fid, '%g', 2); 
end 
% Read the constraint data. 
C = zeros(n_constraint, 5); 
for i = 1:n_constraint 
    C(i,1:3) = fscanf(fid, '%i', 3); C(i,4:5) = fscanf(fid, '%g', 2); 
end 
% Close the file. 
fclose(fid); 
return; % end of function read_input_file 