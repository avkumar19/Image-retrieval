%reading the image given by the user.
im1 = imread('392.jpg');
%preprocessing it.
im1gray = rgb2gray(im1);
%converting into the feature vector.
rh = imhist(im1gray(:,:,1))/255;
gh = imhist(im1gray(:,1,:))/255;
bh = imhist(im1gray(1,:,:))/255;
%scanning the data base and searching the image from it.
for i=1:999
    %use of euclid distance formula
    dr(i) = sqrt(sum((rh-rdata{i}).^2));
    dg(i) = sqrt(sum((gh-gdata{i}).^2));
    db(i) = sqrt(sum((bh-bdata{i}).^2));
end
%sorting the image feature vector created after comparing based on rbg plane. 
newr = sort(dr);
newg = sort(dg);
newb = sort(db);
%finding the actual image no after sorting to display.
for j=1:10
    for i=1:999
        if dr(i) == newr(j)
            saveR(j) = i;
            dr(i) = -1;
        end
    end
end
for j=1:10
    for i=1:999
        if dg(i) == newg(j)
            saveG(j) = i;
            dg(i) = -1;
        end
    end
end
for j=1:10
    for i=1:999
        if db(i) == newb(j)
            saveB(j) = i;
            db(i) = -1;
        end
    end
end
% taking union of all the color plane 
save1 = union(saveR,saveG,'stable');
save = union(save1,saveB,'stable');
%displaying the image.
for j=1:10
    subplot(2,5,j),imshow(sprintf('%d.jpg',save(j)));
end

            