close all
clear
clc

path = '/Users/shreyasskandan/Downloads/RD/Fruits/';
csvfiles = dir([path,'*.txt']);
X = [];
figure,
for file = 1:length(csvfiles)
    fprintf(1,'Doing something with %s\n',csvfiles(file).name);
    fileID = fopen([path csvfiles(file).name]);
    %Intro = textscan(fileID,'%s',13,'Delimiter','\n');
    %InputText = textscan(fileID,'%f%f');
    data_0 = textscan(fileID,'%f%f',13,'headerlines',13);
    data_rest = textscan(fileID,'%f%f');
    data = [[cell2mat(data_0(1));cell2mat(data_rest(1))],...
                   [cell2mat(data_0(2));cell2mat(data_rest(2))]];
    %data = [InputText{1},InputText{2}];
    plot(data(:,1),data(:,2));
    %plot(data(:,2));
    hold on
    X = [X data(:,2)];
end

figure
D = L2_distance(X, X);
options.dims = 3;
[Y, R, E] = Isomap(D, 'k', 2048, options);
keyboard

