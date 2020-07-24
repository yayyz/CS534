function segim = segmentation(I)

% Demo of "Localized Region Based Active Contours"
% 
% Example:
% localized_seg_demo
%
% Coded by: Shawn Lankton (www.shawnlankton.com)​
%I = imread('monkey.png');         %-- load the image
I = im2uint8(I);

m = false(size(I,1),size(I,2));   %-- create initial mask
figure; imshow(I);

% USER INTERFACE HERE!
[x,y] = getpts; %pick two points: upper right corner, botton left corner(init step)
%convert to integer!
x = uint8(x); y = uint8(y);

%store needed points 
x1 = x(1); 
y1 = y(1);
x2 = x(2);
y2 = y(2);

m(y1:y2, x1:x2) = true;

I = imresize(I,.5);  %-- make image smaller 
m = imresize(m,.5);  %   for fast computation

subplot(2,2,1); imshow(I); title('Input Image');
subplot(2,2,2); imshow(m); title('Initialization');
subplot(2,2,3); title('Segmentation');

seg = localized_seg(I, m, 350);  %-- run segmentation

subplot(2,2,4); figure; imshow(seg); title('Final Segmentation');
%imwrite(seg, 'segbw.png'); %use this to create NaN mask

%for 'non-cartoon effect' save seg
%tmp_seg = seg;
%figure; imshow(seg); title('segment2');
%imwrite(seg, 'transparent.png', 'Transparency', [0 0 0]);
%tr = imread('transparent.png'); figure; imshow(tr);

%mask is used to set background to NaN
mask = double(ones(size(seg))); %must be double to work

mask = mask.*seg;
mask((mask == 0)) = NaN;

%mask = uint8(mask);
%r = I(:,:,1); g = I(:,:,2); b = I(:,:,3);
r = double(I(:,:,1)) .* seg;
maxR = max(max(r));
r = r/maxR;

g = double(I(:,:,2)) .* seg;
maxG = max(max(g));
g = g / maxG;

b = double(I(:,:,3)) .* seg;
maxB = max(max(b));
b = b / maxB;

r = r .* mask; %extract segmented image
g = g .* mask; 
b = b .* mask;
I_seg(:,:,1) = r; I_seg(:,:,2) = g; I_seg(:,:,3) = b;

figure; imshow(I_seg); title('Segmented image');
imwrite(I_seg, 'segmented.png');

%==========image with transparent background ==============================

%rescale image
%maxR = max(max(I_seg(:,:,1)));
chan = I_seg(:,:,1);
sizeI = size(chan);
A = repmat(1,sizeI);
A(isnan(I_seg(:,:,1))) = 0;
imwrite(I_seg, 'test.png','Alpha',A);
%figure; imshow('test.png');

segim = imread('test.png'); %figure; imshow(segim);

%{
%if the option: non-cartoon effect
if op == 'n'
    B = bwboundaries(seg, 8, 'noholes');
    %get the boundary for normal 
    for k=1:length(B)
        boundary = B{k};
    end
    
    margin = 2; %set padding    
    for i = 1 : length(boundary)
        row = boundary(i,1);
        col = boundary(i,2);
        if segim(row-1, col) ~= 0
            segim(row-1, col) = 
    end
    
  %}  
    
end
