% -------------------------------------------------------------------------
% ---------------------- REFLECTANCE CLASSIFICATION -----------------------
% --------------------------------------- SHREYAS SKANDAN (UPenn 2016) ----
% --------------------------------------- (sshreyas@seas.upenn.edu) -------

% DATA LAYOUT
% The following code extracts all the reflectance data and stores it in a
% simple learning format where X contains all the training instances and Y
% contains all the training labels. The data was collected as two columns
% of length 2048 dimensions each. This data is extracted, rolled out into a
% single (2048*2) dimensional vector and stored as a single row in the X
% array. The labelled data is stored in the corresponding row index of the
% Y vector. The current code outputs a mat file containing two variables -
% trainingSetX and trainingSetY
% -------------------------------------------------------------------------



close all;
clear;
clc;

% Direct variables to desired reflectance datasets
mainDir = '/Users/shreyasskandan/Desktop/ReflectanceData/Fruits/';
fruitExt = {'1_GD/','2_GS/','3_HC/','4_OR','5_PL','6_RD','7_ST'};
numClasses = length(fruitExt);
DirList = cell(numClasses,1);
data_length = 2048;

% Store filenames into directory list
for dirctr = 1:numClasses 
    DirList{dirctr} = dir(strcat(mainDir,char(fruitExt(dirctr)),'/*.txt'));
end

% Calculate the number of training instances available
total_instances = 0;
for frt = 1:length(DirList)
    total_instances = total_instances + length(DirList{frt});
end

trainingSetX = zeros(total_instances,2*data_length);
trainingSetY = zeros(total_instances,1);

ii = 1;
% Load data into variables and save to mat file
for fruits = 1:length(DirList)
    for instance = 1:length(DirList{fruits})
        fruitVar = DirList{fruits};
        filename = fruitVar(instance).name;
        fruitName = char(fruitExt(fruits));
        fileid = fopen(strcat(mainDir,fruitName,'/',filename));
        data_0 = textscan(fileid,'%f%f',13,'headerlines',13);
        data_rest = textscan(fileid,'%f%f');
        totalDataXi = [[cell2mat(data_0(1));cell2mat(data_rest(1))];...
                       [cell2mat(data_0(2));cell2mat(data_rest(2))]];
        fclose(fileid);
        % Load training data into X variable
        trainingSetX(ii,:) = totalDataXi;
        % Load training data label into Y variable
        trainingSetY(ii,1) = fruits;
        ii = ii + 1;
    end
    save('/Users/shreyasskandan/Desktop/ReflectanceData/Fruits/fruitData.mat','trainingSetX','trainingSetY');
end
