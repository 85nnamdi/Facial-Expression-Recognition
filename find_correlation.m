%%USED
% In this script, I read all the average LBP images stored in a
% folder then, convet them into vectors. read an unknown image and compare
% it with the vectors and find the minimum distance between the vector and
% the unknow lbp image.

clc;
clear;

% %read the directory

%alternative loading style for MATLAB 2016
trainingSet = dir('C:\Users\ekwea\Desktop\THESIS\Codes\Average_images\Experiment 2 Sunday\*.bmp');
path_train = 'C:\Users\ekwea\Desktop\THESIS\Codes\Average_images\Experiment 2 Sunday\';


%alternative loading style for MATLAB 2016
test_Set = dir('C:\Users\ekwea\Desktop\NewDB\Train_Test\Prelim\Anger\*.bmp');
path_test = 'C:\Users\ekwea\Desktop\NewDB\Train_Test\Prelim\Anger';

% loop through my set of images
for test = 1:numel(test_Set)
    
    test_img = imread(strcat(path_test,'\',test_Set(test).name));
    %test_img = rgb2gray(test_img);
    test_img = LBP2(test_img);
    %convert test image to vecotr
    most_similar= 0;
    
    for k=1:numel(trainingSet)
        %read image one after the other
        im = imread(strcat(path_train,'\',trainingSet(k).name));
        
        %convert this image to vector
        im_input = im;
        %im_input= imhist(im);
        % calculate the correlation distance between the images
       distance = corr2(im_input,test_img );
       % distance  = pdist2(im_input,test_img,'cityblock');
        
         if (distance > most_similar)
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
% fprintf('[%d.] \t %s has minimum of: %f and distance of %f\n',test, test_Set.Files{test,1}, minimum,distance);

end
%plot(im_input);
%plot(test_img);

%convert the images