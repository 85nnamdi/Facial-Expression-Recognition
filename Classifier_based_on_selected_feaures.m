%%USED
% In this script, I read all the average LBP images stored in a
% folder then, convet them into vectors. read an unknown image and compare
% it with the vectors and find the minimum distance between the vector and
% the unknow lbp image.

clc;
clear;

% %read the directory

%alternative loading style for MATLAB 2016
trainingSet = dir('C:\Users\ekwea\Desktop\THESIS\Codes\Features\*.bmp');
path_train = 'C:\Users\ekwea\Desktop\THESIS\Codes\Features\';

%alternative loading style for MATLAB 2016
test_Set = dir('C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\surprise\Test\*.bmp');
path_test = 'C:\Users\ekwea\Desktop\NewDB\Train_Test\Color Faces\surprise\Test';

% read the binary image
binary_feaure = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_vecto.bmp');

feature_of_test_im = zeros(63, 63);
%feature_of_test_im =[];
% loop through my set of images
for test = 1:numel(test_Set)
    
    test_img = imread(strcat(path_test,'\',test_Set(test).name));
    test_img = LBP2(test_img);
   
     % extract the feaure of image(i)
            for x=1:63
                for y=1:63
                    if binary_feaure(x,y) ==1 %== im_unKnowm(x,y)
                      % extract the feature of this test image
                          feature_of_test_im(x,y) = test_img(x,y);                        
                    end
                end
            end
            
            feature_of_test_im = uint8(feature_of_test_im);
            
    %This loop compares the features of test and training set
    most_similar= 0;
    
    for k=1:numel(trainingSet)
        %read image one after the other
         im_Training= imread(strcat(path_train,'\',trainingSet(k).name));
            im_Training = uint8(im_Training);
            
        % convert to vector
        %im_Training = nonzeros(im_Training)';
        
        % Calculate the correlation distance between the images
        distance = corr2(im_Training,uint8(feature_of_test_im));

        
         if(distance > most_similar)
              if distance <= 0      %makes sure we don't use 0 or -tive values as min
                  distance =most_similar;
              end
            most_similar = distance;
            %fprintf('%f distance \n',distance);
         end
         fprintf('[%d] \t %f\n',test,distance);
         
     end
%display the minimum distance of this image
fprintf('%f \n',most_similar);

end
