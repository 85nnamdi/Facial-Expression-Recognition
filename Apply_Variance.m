clc;
clear;
% Locate Image directory
directory = dir('*.bmp');
files = {directory.name};

% default value of combined_im = first image
% combined_im = uint16(files{1});

for k=1:numel(files) 
    
    
% Read all the images
    im{k}  = LBP2(imread(files{k}));
    
    
    dim = ndims(im);                     %# Get the number of dimensions for your arrays
    
    image_array = cat(dim+1,im{:});              %# Concatinate all the images to form one array
    
%     Not very useful code.... only for testing performance
%     linear = imlincomb(1,im{1,k}, 'uint8');
%       linear = imlincomb(1,combined_im, 'uint8');

end

linear2 = imlincomb(1,image_array, 'uint8');

% Calculate the variance of the image
im_variance = var(double(image_array),1,dim+1); 

% calculate the mean of the image
im_mean = mean2(im_variance);

%%
% dispaly the mean of all images 
disp(im_mean);

% Pixel value greater than the mean is 1, less than mean is 0. 
% This turns im_mean to binary
bin_im_matrix = im_variance > im_mean;

figure, imshow(bin_im_matrix);

