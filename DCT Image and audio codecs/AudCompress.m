function AudCompress

[file,path] = uigetfile('*.*','Select the audio file to be compressed');
name = strcat(path,file);
[Aud,rate] = audioread(name);

Mat = dct2(Aud);

Mat(abs(Mat) < 0.02) = 0;

New_Aud = idct2(Mat);

audiowrite(strcat(path,extractBefore(file,'.'),' red','.mp3'),New_Aud,rate);

end


