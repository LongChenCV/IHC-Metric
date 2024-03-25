clear all; close all; clc;
groupname   ='groups_6/';
sequences    = '/Users/longchen/Desktop/comused/LightIHC/sequences/' ;
illuminations = '/Users/longchen/Desktop/comused/LightIHC/illumination/' ;


mkdir([illuminations groupname]);

filenames=dir([sequences groupname '*.png']);

for i=1:length(filenames)
    pngname=filenames(i).name;
    I=imread([sequences groupname pngname])
    sigma=80; %set the kernal size of gaussian
    R=I(:, :, 1);
    G=I(:, :, 1);
    B=I(:, :, 1);
    [N1, M1] = size(R);
    Filter= fspecial('gaussian', [N1, M1], sigma); % set the gaussian function
    
    Rblur=double(imfilter(R, Filter, 'replicate'));
    Gblur=double(imfilter(G, Filter, 'replicate'));
    Bblur=double(imfilter(B, Filter, 'replicate'));
    R(R==0)=min(R(R>0), [], 'all');
    G(G==0)=min(G(G>0), [], 'all');
    B(B==0)=min(B(B>0), [], 'all');
    
    Rblur(Rblur==0)=min(Rblur(Rblur>0), [], 'all');
    Gblur(Gblur==0)=min(Gblur(Gblur>0), [], 'all');
    Bblur(Bblur==0)=min(Bblur(Bblur>0), [], 'all');
    
    R_ssr=log(double(R))-log(Rblur);
    G_ssr=log(double(G))-log(Gblur);
    B_ssr=log(double(B))-log(Bblur);
    
    MIN= min(min(R_ssr));
    MAX=max(max(R_ssr));
    R_ssr=uint8(255*(R_ssr-MIN)/(MAX-MIN));
    
    MIN= min(min(G_ssr));
    MAX=max(max(G_ssr));
    G_ssr=uint8(255*(G_ssr-MIN)/(MAX-MIN));
    
    MIN= min(min(B_ssr));
    MAX=max(max(B_ssr));
    B_ssr=uint8(255*(B_ssr-MIN)/(MAX-MIN));
    
    SSR=cat(3, R_ssr, G_ssr, B_ssr)
%     subplot(121), imshow(SSR), title('Reflection');
%     subplot(122), imshow(uint8(Rblur)), title('Illumination');    
    imwrite(uint8(Rblur), [illuminations groupname '/Illumination_' pngname]);
%     imwrite(SSR, [illuminations groupname '/Reflection_' pngname]);
end
