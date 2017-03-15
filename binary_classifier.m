%%USED
%This code gets all the binary images checks which one contains informative
%pixel(1) then creates new binary matrix that is used to extract the
%features from all the average image vectors

clc;
clear;

% Unknown image

Anger_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Anger_bin.bmp');
Disgust_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Disgust_bin.bmp');
Fear_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Fear_bin.bmp');
Happy_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Happy_bin.bmp');
Sad_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Sad_bin.bmp');
Surprise_binary = imread('C:\Users\ekwea\Desktop\THESIS\Codes\Binary_final\Surprise_bin.bmp');

[row, col] = size(Anger_binary);
Binary_vecto = zeros(row, col);        % gather the row and col of the images


         for x=1:row
            for y=1:col
                %== im_unKnowm(x,y)
                if((Anger_binary(x,y) ==1)  && (Disgust_binary(x,y) ==1) && (Fear_binary(x,y) ==1) && (Happy_binary(x,y) ==1) && (Sad_binary(x,y) ==1) && (Surprise_binary(x,y)==1))
                  % features = im_unKnown(x,y);
                      Binary_vecto(x ,y) = 1;
                      %feature_vecto(x,y) = find(feature_vecto(x ,y) ~= im_unKnown(x,y));
                end
            end
         end
         
         disp(Binary_vecto);
         imwrite(uint8(Binary_vecto),'Binary_vecto.bmp','bmp');