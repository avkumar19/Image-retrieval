clc;
clear all;
c=cell(1,70);
rdata = cell(1,70);
gdata = cell(1,70);
bdata = cell(1,70);
for i=1:999
c{i}=imread(sprintf('%d.jpg',i));
im = rgb2gray(c{i});
im = im < 150;
data{i} = imhist(im);
end

