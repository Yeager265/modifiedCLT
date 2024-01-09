function Q_r = rotate_Q(Q, theta)
    % rotate_C Returns stiffness matrix in ply CS.
    %
    % Arguments:
    %   Q     : Stiffness matrix in material CS.
    %   theta : Rotation angle or, in case of a laminate, array of rotation
    %           angles (in radians!).
    %
    % Output:
    %   Q_r   : Stiffness matrix in ply CS or, in case theta is an array
    %           of angles, a cell array with stiffness matrices in ply CS.
    R = Reuter();
    if length(theta) == 1
        T = transformation_matrix(theta);
        Q_r = inv(T)*Q*R*T*inv(R);
    else
        Q_r = cell(length(theta), 1);
        for i=1:length(theta)
            T = transformation_matrix(theta(i));
            Q_r{i} = inv(T)*Q*R*T*inv(R);
        end
    end
end