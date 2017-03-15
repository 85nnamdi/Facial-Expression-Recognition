%USED
%The code in this script converts all the images for training into
%grayscale and averges them so that we can test the correlation with unknow
%images using (find_correlation.m)

clc;
clear;

% read the directory
imagefiles = dir('C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\Surprise\Train\*.bmp');
path = 'C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\Surprise\Train\';

% initialize the sum_image, 
sum_image = double(zeros(64)); %image dimention is 63

%read all images using a for loop 
for k=1:numel(imagefiles)
        %read image one after the other
        
        im = imread(strcat(path,'\',imagefiles(k).name));
        im = rgb2gray(im);
        
%sum each image
    sum_image= imadd(double(im), sum_image);
end

%get the average
average_image = sum_image/numel(imagefiles);
average_image = double(average_image);
%save the matrix to classificatio folder
cd('C:\Users\ekwea\Desktop\THESIS\Codes\Average_images\Experimanet1\');
imwrite(uint8(average_image), 'Surprise_face.bmp','bmp');

