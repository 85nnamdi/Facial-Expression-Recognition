clc;
clear;

% read the directory
imagefiles = dir('C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\surprise\Train\*.bmp');
path = 'C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\surprise\Train\';

%alternative loading style for MATLAB 2016
% im_Dir = fullfile('C:\Users\ekwea\Desktop\NewDB\LBP\Surprise\');
% im_Set = imageDatastore(im_Dir,   'IncludeSubfolders', true, 'LabelSource', 'foldernames');

% initialize the sum_image, 
sum_image = double(zeros(63)); %image dimention is 63

%read all images using a for loop 
for k=1:numel(imagefiles)
        %read image one after the other
        im = imread(strcat(path,'\',imagefiles(k).name));
        im=LBP2(im);
%sum each image
sum_image= imadd(double(im), sum_image);
end

%get the average
average_image = sum_image/numel(imagefiles);
%save the matrix to classificatio folder
cd('C:\Users\ekwea\Desktop\THESIS\Codes\Average_images\Experiment 2 Sunday\');
imwrite(uint8(average_image), 'surprise_face.bmp','bmp');

