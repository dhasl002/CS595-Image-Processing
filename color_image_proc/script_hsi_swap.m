imDay = imread('./resources/scene_day.jpg');
imNight = imread('./resources/scene_night.jpg');

nRedLayer = imNight(:,:,1);
nGreenLayer = imNight(:,:,2);
nBlueLayer = imNight(:,:,3);

dRedLayer = imDay(:,:,1);
dGreenLayer = imDay(:,:,2);
dBlueLayer = imDay(:,:,3);

nHue = getHue(nRedLayer, nGreenLayer, nBlueLayer);
nSat = getSaturation(nRedLayer, nGreenLayer, nBlueLayer);
nIntensity = (nRedLayer+nGreenLayer+nBlueLayer)./3;

dHue = getHue(dRedLayer, dGreenLayer, dBlueLayer);
dSat = getSaturation(dRedLayer, dGreenLayer, dBlueLayer);
dIntensity = (dRedLayer+dGreenLayer+dBlueLayer)./3;

dIPic = cat(3,nHue,nSat,dIntensity);
nIPic = cat(3,dHue,dSat,nIntensity);

imwrite(dIPic, './results/day_intensity_swap.jpg');
imwrite(nIPic, './results/night_intensity_swap.jpg');

