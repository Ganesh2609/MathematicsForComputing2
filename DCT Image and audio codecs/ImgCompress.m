function ImgCompress

[file,path] = uigetfile('*.*','Select the image to compress');
name = strcat(path,file);
img = imread(name);

if(size(img,3) == 3)
    [R,G,B] = imsplit(img);
    
    R = dct2(double(R));
    
    R(abs(R) < 15) = 0;
    
    G = dct2(double(G));
    
    G(abs(G) < 15) = 0;
    
    B = dct2(double(B));
    
    B(abs(B) < 15) = 0;
    
    R = uint8(idct2(R));
    G = uint8(idct2(G));
    B = uint8(idct2(B));
    
    New_img = cat(3,R,G,B);
    
else 
    Mat = dct2(double(img));
    Mat(abs(Mat) < 15) = 0;

    New_img = uint8(idct2(Mat));
end

imwrite(New_img,strcat(path,extractBefore(file,'.'),' red','.jpeg'));

end