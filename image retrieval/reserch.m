clc;
X(1) = o1;
X(2) = o2;
X(3) = o3;
X(4) = o4;
X(5) = o5;
X(6) = o6;
X(7) = o7;
X(8) = o8;
X(9) = o9;
X(10) = o10;
X1 = sort(X,'descend');
display(X);
display(X1);

im1 = imread('234.jpg');
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

for i=1:10
    for j=1:10
        if(X(j) == X1(i))
            UltraSave(i) = j;
            X(j) = -1;
            break
        end
    end
end
display(UltraSave);
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(UltraSave(j))));
end

            