%��ͳ����NSWT�ֽ⣬Ȼ���Ƶȡ����ֵ��󣬵�Ƶ��ƽ��
clc;
clear;
tic;
count = 100;  % �ں�ͼ����
level = 6;
BaseName = 'D:\Fusion\Resize512\';
BaseNameSave = 'D:\Fusion\Compare\';
for i=1:count 
     str = strcat(BaseName, num2str(i), '.bmp');
     [Img(:,:,i), map] = imread(str);
end
 I1(:,:)=Img(:,:,1);
 C1 = atrousdec(double(I1),'9-7',level);
 C3 = C1;
 for c = 2:count
   I2(:,:) = Img(:,:,c);
   C2 = atrousdec(double(I2),'9-7',level);
   for s=1:length(C1)   
       if s == 1
          C3{s}(:,:) =( C2{s}(:,:)+C1{s}(:,:))/2;
       else
          C3{s}(:,:) = C3{s}(:,:).*(abs(C3{s}(:,:))>=abs(C2{s}(:,:))) + C2{s}(:,:).*(abs(C3{s}(:,:))<abs(C2{s}(:,:)));
       end
   end
 end
Y = atrousrec(C3,'9-7');
toc;
I = uint8(Y);
imshow(uint8( Y));
title(['�ں�ͼ��']);
str = strcat(BaseNameSave, 'NSWT_MAX_AVG', '.bmp');
imwrite(uint8(Y),str);