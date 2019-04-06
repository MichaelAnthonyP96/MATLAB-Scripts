%read_input_file Matlab function
function [num_nodes, num_Elem,N_coords, EC, BC] = read_input_filePA4(filename) 
%=========================================================================== 
% This function can be used to read input files for PA#4, that is, input  
% files for bilinear quadrilateral elements. It should work without modifications. 
%
% This function works by using the built-in Matlab function fscanf to read 
% through the input file and extract its data. These data are then assigned 
% to variables which are passed out of the function for use in your FEA code. 
%
% If you want to write your own input file and read it in with this 
% function, you must carefully follow the format specified in PA#4 on the  
% first page of the assignment, otherwise this code will not work correctly. 
% 
% Input: filename is a Matlab string specifying the input file you want to  
%        use. Example: read_input_file('class_problem.txt')
% Output: num_nodes number of nodes in the mesh
%         N_coords node number and its coordinates 
%         EC is the element data. Each row contains [elem#, node_1, node_2, 
%              node_3, node_4]
%         BC is the node constraint data. Each row contains [node#, if_constrained, ... 
%              constrained_value] where if_constrained is either 1 or 0 to indicate
%              whether it is constrained or not. constrained_value is the
%              value specified at that node if a condition exists. 
%=========================================================================== 
% Open the file for reading. 
fid = fopen(filename,'r'); 
% Get the comments to be ignored
comments = fscanf(fid,'%s',11);
% Get the node number to be ignored
line_start = fscanf(fid,'%s',1);
i = 1;
while(line_start ~= '%')
    N_coords(i,1:2) = fscanf(fid,'%g',2);
    line_start = fscanf(fid,'%s',1);
    i = i + 1;
end
% Assign the number of nodes after determining how many there are
num_nodes = length(N_coords);
% Read the comments to be ignored
comments = fscanf(fid,'%s',18);
% Read the initial node number to be ignored
line_start = fscanf(fid,'%s',1);
i = 1;
% Read the Element Connectivity
while(line_start ~= '%')
    EC(i,1:4) = fscanf(fid,'%i',4);
    % Read in the node number to be ignored
    line_start = fscanf(fid,'%s',1);
    % Update the counter
    i = i + 1;
end
num_Elem = length(EC);
% Read the comments to be ignored
comments = fscanf(fid,'%s',36);
% Read the initial node number to be ignored
line_start = fscanf(fid,'%s',1);
% Read the Boundary condition data
for i = 1:num_nodes
    BC(i,1:2) = fscanf(fid,'%g',2);
    line_start = fscanf(fid,'%s',1);
end
% Close the file. 
fclose(fid); 
return; % end of function read_input_file