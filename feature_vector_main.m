%%USED
% code to compare binary matrix and extract the pixel content of the
% compared image to a vector
clc;
%clear;

% read binary image
directory = dir('C:\Users\ekwea\Desktop\NewDB\Train_Test\LBP\Surprise\*.bmp');
path = 'C:\Users\ekwea\Desktop\NewDB\Train_Test\LBP\Surprise\';

%initialize the features of selected vector
feature_vector_after_selection = [];

%open file for writing vectors
fp=fopen('feature_vectors_1006exp.txt','a+');

feature_vecto = zeros(63, 63);

for k=1:numel(directory)
    
    im =  imread(strcat(path,'\',directory(k).name));
%     im{:} = imread(filename); %read the test image
    
    %# Concatinate all the images to form one array
%     image_array = cat(dim+1,im{:});      
%     im_unKnown = im_unKnown + double(image_array(:,k));
%     

for kk = 1:63
    for yy = 1:63
        if(Binary_vecto(kk,yy)==1)
            feature_vector_after_selection = [feature_vector_after_selection im(kk,yy)];
        end
    end
end

  fprintf(fp,'%d \n', feature_vector_after_selection);
  
end


%  divide all the added images with the ni=umber of images
%  im_unKnown= im_unKnown/numel(files); 
   
%         for x=1:row
%             for y=1:col
%                 if im_bin(x,y) ==1 
%                   %if the pixel in the binary image is equal to 1, get the
%                   %corresponding pixel value in the unknown image
%                   
%                   feature_vecto(x,y) =  im_unKnown(x,y);
%                   
%                 end
%             end
%         end
        
  % Vecotrize the selected features
feature_vecto = nonzeros(uint8(feature_vecto))';
  
  fclose(fp);
