
%{
%case1=====================================================================

%get the input from the user (img path)
%im = input('Enter the name of the file', 's');

%====================bilateral filter (by using cartoon.m function) =======
img = double(imread('apple.png'))/255;
%cartimg = cartoon(img); %figure; imshow(cartimg);

%=========================user interface ==================================
%userDraw(cartimg);

%=========================segmentation=====================================
segim = segmentation(img); 

%=========================resize===========================================
rscim = resize(segim);
figure; imshow(rscim); title('method1 final');
imwrite(rscim, 'method1_apple_normal.png');
%}
% image dimensions limit: 300 x 300 
%case2=====================================================================

%get the input from the user(img path)
im = input('Enter the name of the file: ', 's');
%this = imread('dog1.png'); figure; imshow(this);

%ask for the options
op = input('type c for cartoon or type n for normal: ', 's'); 

switch op
    case 'c'
        im = imread(im);
        
        segim = segmentation(im); % figure; imshow(segim); title('segmentation');
        imwrite(segim, 'intermid.png');
        %bilateral filter
        segim = im2double(segim); 
        
        cartimg = cartoon(segim); %figure; imshow(cartimg);title('cartoon!');
        %resize
        rscim = resize(cartimg); %figure; imshow(rscim); title('resized!');
        %return to user 
        figure; imshow(rscim); title('final!');
        out = input('file name to save: ', 's');
        imwrite(rscim, out);
    case 'n'
        im = imread(im);
        segim = segmentation(im); % figure; imshow(segim); title('segmentation');

        %resize
        rscim = resize(segim); %figure; imshow(rscim); title('resized!');
        %return to user 
        figure; imshow(rscim); title('final!');
        out = input('file name to save: ', op);
        imwrite(rscim, out);
        
    otherwise
        disp('Usage: c for cartoon, n for normal');
end

%segmentation

%{
im = imread(im);
segim = segmentation(im); % figure; imshow(segim); title('segmentation');

%bilateral filter
    segim = im2double(segim);
    cartimg = cartoon(segim); %figure; imshow(cartimg);title('cartoon!');
%resize
    rscim = resize(cartimg); %figure; imshow(rscim); title('resized!');
%return to user 
    figure; imshow(rscim); title('final!');
    out = input('file name to save: ', 's');
    imwrite(rscim, out);
%}
