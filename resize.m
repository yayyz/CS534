function smallIm = resize(im)
%RESIZE Summary of this function goes here
%   Detailed explanation goes here
%img = imread(im);
%figure; imshow(img);

%for loop!
i2 = impyramid(im, 'reduce');
%i3 = impyramid(i2, 'reduce');
%i4 = impyramid(i3, 'reduce');
%i5 = impyramid(i4, 'reduce');
%figure, imshow(i3);

%write to a file? 
smallIm = i2;
end

