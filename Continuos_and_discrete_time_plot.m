%%%%%%%%%%%%%%%%%
% Part A %%%%%%%%
%%%%%%%%%%%%%%%%%


f = figure('units','normalized','outerposition', [0 0 1 1])


t = 0:0.001:0.666
Fq = 3 % Sinewave frequency 
x_t = sin(2*pi*Fq*t) % Continuous data sinewave formula


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Continuous time signal plot%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tiledlayout(2,2);
nexttile
plot (t, x_t, 'LineWidth', 2) % Continuous data sinewave graph 
title('Comparison of continuous and discrete time signals','color', 'black', 'FontWeight', 'bold', 'fontsize', 16)
% "title" adds a name for a plot, also there are additional commands to
% change the font, color, thickness 
xlabel('Time (s)','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labels X line
ylabel('Magnitude','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labes Y line 
ylim([-1.1 1.1]) % configures Y line to have a range from -1.1 to 1.1
grid %adds mesh like structure to graph to see the graph clearer 
hold on % holds the graph so  another graph can be plotted on top 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Data to find Discrete time signal and plotting it%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nyquist rate = 6Hz 
Fs = 30 % 6hz * 5
Ts = 1/Fs % Sampling period Ts = 1/30hz
T = 1/Fq % The period 
N = T/Ts % Number of samples per period 
n = 0:1:2*N - 1 % 20 samples range 
nTs = n*Ts % Sampling interval (samples range multiplied by sampling period to have a range of data for graph)
x_n = sin(2*pi*3*nTs)% Discrete signal formula and calculation

stem(nTs, x_n) % plots a discrete time data graph
title('Comparison of continuos and discrete time signals','color', 'black', 'FontWeight', 'bold', 'fontsize', 16) 
xlabel('Time (s)','color', 'black', 'FontWeight', 'bold', 'fontsize', 14)
ylabel('Magnitude','color', 'black', 'FontWeight', 'bold', 'fontsize', 14)
legend ({'Continuous Time' 'Discrete Time'}, 'FontSize', 12, 'Box',"off") % points which line is continuous and which is discrete
hold off % releases both graphs together

Table = [nTs, x_n] % results simple table of discrete data 

%%%%%%%%%%%%%%%%
%Saves the data%
%%%%%%%%%%%%%%%%

saveas(f,'graphics.jpg') % saves graph into JPEG file
save('data.m','Table','-ascii') %saves discrete time data table to .m file 
writematrix(Table) % saves table to .txt file
type 'T.txt'
exceldata = 'exceldiscretedata.xlsx'; %saves discrete data to Excel file 
xlswrite(exceldata,nTs) 


%%%%%%%%
%Part B%
%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Rounding(quontization) discrete data to a range of numbers and plotting it%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

yaxis = (-1:0.2:1) % yaxis quantisation range


x_n_rounded = round(x_n,1)


nexttile
hold on
stem(nTs, x_n_rounded) %plotting new rounded data


plot (t, x_t, 'LineWidth', 2) % Continuous data sinewave graph 
title('Comparison of continuous and discrete time signals with rounded points','color', 'black', 'FontWeight', 'bold', 'fontsize', 16)
legend ({'Discrete time' 'Continuous Time'}, 'FontSize', 12, 'Box',"off")
xlabel('Time (s)','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labels X line
ylabel('Magnitude','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labes Y line 
grid
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Making the continuous line with interpolation command%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Spline graph%


nexttile 
hold on 
stem(nTs,x_n_rounded)

 
xq = [0:0.01:0.6333]


vq1 = interp1(nTs, x_n_rounded ,xq,'spline')
plot(xq,vq1)

title('Spline interpolated discrete signal','color', 'black', 'FontWeight', 'bold', 'fontsize', 16)
legend ({'Discrete time' 'Continuous Time'}, 'FontSize', 12, 'Box',"off")
xlabel('Sampling interval','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labels X line
ylabel('Discrete signal magnitude','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labes Y line
ylim([-1.1 1.1])
grid
hold off 


%Linear graph%


nexttile
hold on 
stem(nTs,x_n_rounded)

xq = [0:0.01:0.6333]

vq1 = interp1(nTs, x_n_rounded ,xq,'linear')
plot(xq,vq1)
title('Linear interpolated discrete signal','color', 'black', 'FontWeight', 'bold', 'fontsize', 16)
legend ({'Discrete time' 'Continuous Time'}, 'FontSize', 12, 'Box',"off")
xlabel('Sampling interval','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labels X line
ylabel('Discrete signal magnitude','color', 'black', 'FontWeight', 'bold', 'fontsize', 14) % labes Y line
ylim([-1.1 1.1])
grid
hold off




