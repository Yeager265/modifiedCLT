%% CLT of SIS skin laminate using CFG 1.0
clear
clc
addpath 'C:\Users\CMT\Documents\GitHub\modifiedCLT' %So that folders from modified CLT are available in this folder

%% Layup input
layup_file = "2023_Panels/SIS_layup.xlsx";
layup_input_data = readcell(layup_file); % Read in layup configuration

material_file = "2023_Panels/material_properties.xlsx";
material_input_data = readcell(material_file); % Read in used material data

%% Output Options
% yes or no
expanded_layup_data_selected = 'yes';

%% Layup data manipulation
size_layup_data = size(layup_input_data);
size_mat_data = size(material_input_data);
n_layers = size_layup_data(1,1);
n_mats = size_mat_data(1,1);

expanded_layup_data = cell(n_layers,8);


for i=2:n_layers
    mat_index = cell2mat(layup_input_data(i,2));
    angle_deg = cell2mat(layup_input_data(i,3));
    angle_rad = angle_deg*(pi/180);
    t = cell2mat(layup_input_data(i,4))
    Q_bar_carray= cell(n_layers,1);

    for k=2:n_mats
        if mat_index == cell2mat(material_input_data(k,1))%check that this is the indexed material
            layer_mat_prop = material_input_data(k,:); %retrieve material properties
            E1 = cell2mat(layer_mat_prop(3));
            E2 = cell2mat(layer_mat_prop(4));
            v12 = cell2mat(layer_mat_prop(5));
            G12 = cell2mat(layer_mat_prop(6));
            Q = stiffness_matrix(E1, E2, v12, G12);
            Q_bar = 
            break
        end

    end

end

%comb_layup_data = ['layer_no','orientation','thickness','E1','E2','G12','v12','t'];
