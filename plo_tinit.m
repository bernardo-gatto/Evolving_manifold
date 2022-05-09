clear all;
close all;

A = load('results_all.mat');
B = load('iteractions_200_all.mat');

pA = A.results;
pB = B.new_reports;






% figure,
% plot(pA);

figure,
plot(pB');