clear all;
close all;

A = load('results_all.mat');
results = A.results;

raw_data = results';
sorted_data = sort(results);

avr_data = sum(sorted_data')./100;
std_data = std(sorted_data');

plot(avr_data);
plot(std_data);


y = avr_data;%rand(1,10); % your mean vector;
x = 1:numel(y);
std_dev = std_data + 2;%1;
curve1 = y + std_dev;
curve2 = y - std_dev;
x2 = [x, fliplr(x)];
inBetween = [curve1, fliplr(curve2)];
%fill(x2, inBetween, [ 0.5843 0.8157 0.9882], 'LineStyle','none');
fill(x2, inBetween, [226/255 202/255 210/255], 'LineStyle','none');
hold on;
%plot(x, y, 'b', 'LineWidth', 1);
plot(x, y, 'color', [196/255 78/255 82/255], 'LineWidth', 1);
%set(gca,'color', [234/255 234/255 242/255])
set(gca,'color', [0.95 0.95 0.95])


[78 115 177];
[202 210 228];
[234 234 242];

[196/255 78/255 82/255];
[226/255 202/255 210/255];

max(max(results))
grid on;