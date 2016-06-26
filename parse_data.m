close all;
clear;
clc;

% Direct variables to desired reflectance datasets
mainDir = '/Users/shreyasskandan/Desktop/ReflectanceData/Fruits/';
fruitExt = {'1_GD/','2_GS/','3_HC/','4_OR','5_PL','6_RD','7_ST'};
numClasses = length(fruitExt);
DirList = cell(numClasses,1);

% Store filenames into directory list
for dirctr = 1:numClasses 
    DirList{dirctr} = dir(strcat(mainDir,char(fruitExt(dirctr)),'/*.txt'));
end

% Load data into variables and save to mat file
for fruits = 1:length(DirList)
    fruitfilename = sprintf('fruit%d.mat',fruits);
    for instance = 1:length(DirList{fruits})
        fruitVar = DirList{fruits};
        filename = fruitVar(instance).name;
        fruitName = char(fruitExt(fruits));
        A = file_read_command(strcat(mainDir,fruitName,'/',filename));
    end
    save(fruitfilename,'A');
end
