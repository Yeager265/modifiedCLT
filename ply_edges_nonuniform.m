function z = ply_edges_nonuniform(t_array)
    % ply_edges_nonuniform Returns ply top and bottom surface locations.
    %
    % Arugments:
    %   t_array : Array of ply thicknesses ordered from max z to min z
    %
    % Output:
    %   z : Array of length n+1 with the locations of the ply edges.
    %% Move that over to the function
    z_zero = zeros(length(t_array)+1, 1);
    z_max = sum(cell2mat(t_array(:)));
    z_zero(1) = z_max;
    for i=1:length(t_array)
           z_zero(i+1) = z_zero(i) - cell2mat(t_array(i));
    end
    midplane = max(z_zero)/2;
    z = z_zero - midplane;

end