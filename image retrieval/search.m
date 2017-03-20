clc;
im1 = imread('650.jpg');
im1gray = rgb2gray(im1);
rh = imhist(im1gray(:,:,1))/255;
gh = imhist(im1gray(:,1,:))/255;
bh = imhist(im1gray(1,:,:))/255;

for i=1:999
    d(i) = sqrt(sum((rh-rdata{i}).^2))+sqrt(sum((gh-gdata{i}).^2))+ sqrt(sum((bh-bdata{i}).^2));
end
new = sort(d);

for j=1:10
    for i=1:999
        if d(i) == new(j)
            save(j) = i;
            d(i) = -1;
        end
    end
end
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(j)));
end

            