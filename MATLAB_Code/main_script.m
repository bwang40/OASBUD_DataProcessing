% main script to run the code
%% load data from origin file.
close all;clear all;clc;

disp('Loading Data from Original .mat file...');
load('OASBUD.mat');
disp('Loading Done!');

%% parameters

c = 1540; % speed of sound 1540 m/s
width = 38; % aperture width 38 mm
fs = 40e6; % sampling frequency 40 MHz

%% generating envelope_rf1 and envelope_rf2
% this is because if I save these data in the mat file, the mat file will
% be too large; Most importantly, the processing of the data is fast
for index=1:100
    rf = data(index).rf1;
    envelope_image = 20 * log10(abs(hilbert(rf)));
    min_data = min(min(envelope_image));
    max_data = max(max(envelope_image));
    normalized_envelope_rf1 = uint8((envelope_image-min_data)/(max_data-min_data)*255);
    data(index).envelope_rf1=normalized_envelope_rf1;
    
    rf = data(index).rf2;
    envelope_image = 20 * log10(abs(hilbert(rf)));
    min_data = min(min(envelope_image));
    max_data = max(max(envelope_image));
    normalized_envelope_rf2 = uint8((envelope_image-min_data)/(max_data-min_data)*255); 
    data(index).envelope_rf2=normalized_envelope_rf2;
end
%% This is to display the data for a better understand
% the displayed data include, normalized rf1 rf2, roi1, roi2, and
% histograms of the normalized data

index = randi(100);
result = data_display(data,index);

%% this is to display the data with roi marked in the figure


%% data re-organize to prepare for training data
% the data recorded in this structure is normalized uint8 format
training_data_prep = struct;
for i = 1:100
    training_data_prep((i-1)*2+1).class = data(i).class;
    training_data_prep((i-1)*2+2).class = data(i).class;
    training_data_prep((i-1)*2+1).birads = data(i).birads;
    training_data_prep((i-1)*2+2).birads = data(i).birads;
    training_data_prep((i-1)*2+1).id = data(i).id;
    training_data_prep((i-1)*2+2).id = data(i).id;
    training_data_prep((i-1)*2+1).rf = data(i).envelope_rf1;
    training_data_prep((i-1)*2+2).rf = data(i).envelope_rf2;
    training_data_prep((i-1)*2+1).roi = data(i).roi1;
    training_data_prep((i-1)*2+2).roi = data(i).roi2;
end
%% the first training is going to be lesion detection using sliding box 
index = randi(200);
buffer = training_data_prep(index);

test_roi = buffer.roi;
test_rf = buffer.rf;
x_max = size(test_rf,2);
y_max = size(test_rf,1);

x_step = 10;
y_step = 10;
x_box = 40;
y_box = 40;

judge_threshold = 30; %when the area contains more than threshold % positive result, then the result should be positive

BW = edge(test_roi,'canny');
BW=uint8(BW)*255;

%imshow(rf+BW);
%caxis([100 255]);
x_boundry = x_max-x_box-1;
y_boundry = y_max-y_box-1;

x_pos = randi(x_boundry);
y_pos = randi(y_boundry);


test_rf(:,x_pos)=255;
test_rf(y_pos,:)=255;
test_rf(:,x_pos-1)=255;
test_rf(y_pos+1,:)=255;
test_rf(:,x_pos+x_box-1)=255;
test_rf(y_pos+x_box-1,:)=255;
test_rf(:,x_pos+x_box-1-1)=255;
test_rf(y_pos+x_box-1+1,:)=255;

imshow(test_rf+BW);
caxis([100 255])

%data_display_label(test_rf,test_roi);
%%
training_data_prep2=struct;
for index=1:200
    buffer = training_data_prep(index);
    test_roi = buffer.roi;
    test_rf = buffer.rf;
    
    x_max = size(test_rf,2);
    y_max = size(test_rf,1);
    
    x_boundry = x_max-x_box-1;
    y_boundry = y_max-y_box-1;
    
    x_num = fix(x_boundry/x_step);
    y_num = fix(y_boundry/y_step);


    number_of_frames = x_num*y_num;
    training_data = zeros(x_box,y_box,number_of_frames);
    training_output = zeros(number_of_frames,1);
    for x_index=1:x_num
        for y_index=1:y_num
            buffer = zeros(x_box,y_box);
            ture_index = (y_index-1)*x_num + x_index;
            x_ture_position = (x_index-1)*x_step+1;
            y_ture_position = (y_index-1)*y_step+1;
            training_data(:,:,ture_index) = test_rf(y_ture_position:y_ture_position+y_box-1,x_ture_position:x_ture_position+x_box-1);
            buffer(:,:) = test_roi(y_ture_position:y_ture_position+y_box-1,x_ture_position:x_ture_position+x_box-1);
            num_of_ones = sum(sum(buffer==1));
            if(num_of_ones >= judge_threshold/100*x_box*y_box)
                training_output(ture_index)=1;
            end
        end
    end
    training_data_prep2(index).training_data =  training_data;
    training_data_prep2(index).training_output =  training_output;
    training_data_prep2(index).class =  training_data_prep(index).class;
    training_data_prep2(index).birads =  training_data_prep(index).birads;
    training_data_prep2(index).id =  training_data_prep(index).id;
end







