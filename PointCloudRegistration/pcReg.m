close all
clc

%% ENTRADA
%CONEJO1
ptCloud = pcread('bun_zipper.ply');

A= rotx(-90);
A= [A; [0 0 0]];
A= [A [0;0;0;1]]
        
tform1 = affine3d(A);

bunny = pctransform(ptCloud,tform1);

%CONEJO2
A= roty(15);
A= [A; [0.1 0 0]];
A= [A [0;0;0;1]]    
tform1 = affine3d(A);

bunny2 = pctransform(bunny,tform1);

pcshow(bunny2); 
title('bunny transformed');

figure;
pcshowpair(bunny, bunny2);
title('Comparacion');

tICP= pcregrigid(bunny2,bunny,'Extrapolate',false, 'Tolerance', [0.001, 0.001],...
    'MaxIterations', 40);

B=tICP.T
tform2 = affine3d(B);

bunnyR = pctransform(bunny2,tform2);

figure;
pcshowpair(bunny, bunnyR);
title('Comparacion ICP');


tform = pcregistercpd(bunny2,bunny);


