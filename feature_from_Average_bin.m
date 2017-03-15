% code to compare binary matrix and extract the pixel content of the
% compared image to a vector
clc;
clear;
 
% read binary image
im_bin = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_vecto.bmp');

% unknown image
im_unKnown = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Average_images\Experiment 2 Sunday\Surprise_face.bmp');

[row, col] = size(im_unKnown);
feature_vecto = zeros(row, col);        % gather the row and col of the images

%feature_vecto=[];
         for x=1:row
            for y=1:col
                if im_bin(x,y) ==1 %== im_unKnowm(x,y)
                  % features = im_unKnown(x,y);
                      feature_vecto(x,y) = im_unKnown(x,y);
                      %feature_vecto = [feature_vecto(x ,y) im_unKnown(x,y)];
                end
            end
        end
    
% feature_vecto = features;
%feature_vecto = nonzeros(feature_vecto)';

