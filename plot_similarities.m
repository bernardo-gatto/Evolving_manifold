clear all;
close all;

data_OMSM_GDS = load('conf_OMSM_GDS.mat');
data_OMSM = load('conf_OMSM.mat');
data_GDS = load('conf_GDS.mat');

figure
colormap('hot')
imagesc(data_OMSM_GDS.confusion)

figure
colormap('hot')
imagesc(data_OMSM.confusion)

figure
colormap('hot')
imagesc(data_GDS.confusion)


% data_OMSM_GDS.confusion

% data_OMSM.confusion

% data_GDS.confusion

n_data_GDS = log(data_GDS.confusion);
figure
colormap('hot')
imagesc(n_data_GDS)

n_data_OMSM = exp(data_GDS.confusion);
figure
colormap('hot')
imagesc(n_data_OMSM)


colormap('hot')
t = tiledlayout(1,3);
nexttile
imagesc(n_data_GDS)
nexttile
imagesc(data_OMSM.confusion)
nexttile
imagesc(n_data_OMSM)



