close all;
clear;
clc;

numClasses = 7;
DirList = cell(numClasses,1);
mainDir = '/Users/shreyasskandan/Desktop/ReflectanceData/Fruits/';
fruitExt = {'1_GD/','2_GS/','3_HC/','4_OR','5_PL','6_RD','7_ST'};
GD_dir = dir(strcat(mainDir,char(fruitExt(1)),'/*.txt'));
GS_dir = dir(strcat(mainDir,char(fruitExt(2)),'/*.txt'));
HC_dir = dir(strcat(mainDir,char(fruitExt(3)),'/*.txt'));
OR_dir = dir(strcat(mainDir,char(fruitExt(4)),'/*.txt'));
PL_dir = dir(strcat(mainDir,char(fruitExt(5)),'/*.txt'));
RD_dir = dir(strcat(mainDir,char(fruitExt(6)),'/*.txt'));
ST_dir = dir(strcat(mainDir,char(fruitExt(7)),'/*.txt'));
DirList{1} = GD_dir;DirList{2} = GS_dir;DirList{3} = HC_dir;DirList{4} = OR_dir;
DirList{5} = PL_dir;DirList{6} = RD_dir;DirList{7} = ST_dir;


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
