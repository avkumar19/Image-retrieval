
clc;
clear all;
c=cell(1,999);
rdata = cell(1,999);
gdata = cell(1,999);
bdata = cell(1,999);
for i=1:999
c{i}=imread(sprintf('%d.jpg',i));
im = rgb2gray(c{i});
rdata{i} = imhist(im(:,:,1))/255;
gdata{i} = imhist(im(:,1,:))/255;
bdata{i} = imhist(im(1,:,:))/255;
end


