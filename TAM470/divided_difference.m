function Cn = divided_difference( start, finish, x_nodes, f_nodes )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if ( start == finish)
       Cn = f_nodes(start);
    else 
       Cn = (divided_difference(start+1,finish,x_nodes,f_nodes) - divided_difference(start,finish-1,x_nodes,f_nodes))/(x_nodes(finish) - x_nodes(start));
    end
end

