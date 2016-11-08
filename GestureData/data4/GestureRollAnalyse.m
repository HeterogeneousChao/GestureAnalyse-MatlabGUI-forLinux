%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%% Gesture Roll analyse 
%%%%
%%%%            ZHAOCHAO
%%%%                2016-11-08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%

figure(1);
figure(2);

%%%% roll-origin 

load data_origin_slow.dat

dat = data_origin_slow;

index_left = find(dat(:,1) == 0);
origin_left_att = dat(index_left, 2:4);
origin_left_acc = dat(index_left, 8:10);
origin_left_gyro = dat(index_left, 5:7);


index_right = find(dat(:,1) == 2);
origin_right_att = dat(index_right, 2:4);
origin_right_acc = dat(index_right, 8:10);
origin_right_gyro = dat(index_right, 5:7);

figure(1);
% att
% x-t, y-z
subplot(2,3,1);
tmp_t = [1: 1: size(origin_left_att(:,1), 1)];
plot(tmp_t, origin_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(origin_right_att(:,1), 1)];
plot(tmp_t, origin_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('origin-angle');

% acc
% x-x, y-z
subplot(2,3,4);
tmp_t = [1: 1: size(origin_left_acc(:,1), 1)];
plot(tmp_t, origin_left_acc(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(origin_right_acc(:,1), 1)];
plot(tmp_t, origin_right_acc(:,2), 'b*-');
grid on;
legend('left', 'right');
title('origin-acc');

figure(2);
% att
% x-t, y-z
subplot(2,3,1);
tmp_t = [1: 1: size(origin_left_att(:,1), 1)];
plot(tmp_t, origin_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(origin_right_att(:,1), 1)];
plot(tmp_t, origin_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('origin-angle');

% acc
% x-x, y-z
subplot(2,3,4);
plot(origin_left_acc(:,1), origin_left_acc(:,3), 'rs-');
hold on;
plot(origin_right_acc(:,1), origin_right_acc(:,3), 'b*-');
grid on;
legend('left', 'right');
title('origin-acc');


%%%% roll-remote

load data_remote_slow.dat

dat = data_remote_slow;

index_left = find(dat(:,1) == 0);
remote_left_att = dat(index_left, 2:4);
remote_left_acc = dat(index_left, 8:10);
remote_left_gyro = dat(index_left, 5:7);

index_right = find(dat(:,1) == 2);
remote_right_att = dat(index_right, 2:4);
remote_right_acc = dat(index_right, 8:10);
remote_right_gyro = dat(index_right, 5:7);

figure(1);
% att
% x-x, y-z
subplot(2,3,2);
tmp_t = [1: 1: size(remote_left_att(:,1), 1)];
plot(tmp_t, remote_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(remote_right_att(:,1), 1)];
plot(tmp_t, remote_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('remote-angle');

% acc
% x-x, y-z
subplot(2,3,5);
tmp_t = [1: 1: size(remote_left_acc(:,1), 1)];
plot(tmp_t, remote_left_acc(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(remote_right_acc(:,1), 1)];
plot(tmp_t, remote_right_acc(:,2), 'b*-');
grid on;
legend('left', 'right');
title('remote-acc');


figure(2);
% att
% x-x, y-z
subplot(2,3,2);
tmp_t = [1: 1: size(remote_left_att(:,1), 1)];
plot(tmp_t, remote_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(remote_right_att(:,1), 1)];
plot(tmp_t, remote_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('remote-angle');

% acc
% x-x, y-z
subplot(2,3,5);
plot(remote_left_acc(:,1), remote_left_acc(:,3), 'rs-');
hold on;
plot(remote_right_acc(:,1), remote_right_acc(:,3), 'b*-');
grid on;
legend('left', 'right');
title('remote-acc');


%%%% roll-dual

load data_dual_slow.dat

dat = data_dual_slow;

index_left = find(dat(:,1) == 0);
dual_left_att = dat(index_left, 2:4);
dual_left_acc = dat(index_left, 8:10);
dual_left_gyro = dat(index_left, 5:7);

index_right = find(dat(:,1) == 2);
dual_right_att = dat(index_right, 2:4);
dual_right_acc = dat(index_right, 8:10);
dual_right_gyro = dat(index_right, 5:7);


figure(1);
% att
% x-x, y-z
subplot(2,3,3);
tmp_t = [1: 1: size(dual_left_att(:,1), 1)];
plot(tmp_t, dual_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(dual_right_att(:,1), 1)];
plot(tmp_t, dual_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('dual-angle');

% acc
% x-x, y-z
subplot(2,3,6);
tmp_t = [1: 1: size(dual_left_acc(:,1), 1)];
plot(tmp_t, dual_left_acc(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(dual_right_acc(:,1), 1)];
plot(tmp_t, dual_right_acc(:,2), 'b*-');
grid on;
legend('left', 'right');
title('dual-acc');


figure(2);
% att
% x-x, y-z
subplot(2,3,3);
tmp_t = [1: 1: size(dual_left_att(:,1), 1)];
plot(tmp_t, dual_left_att(:,2), 'rs-');
hold on;
tmp_t = [1: 1: size(dual_right_att(:,1), 1)];
plot(tmp_t, dual_right_att(:,2), 'b*-');
grid on;
legend('left', 'right');
title('dual-angle');

% acc
% x-x, y-z
subplot(2,3,6);
plot(dual_left_acc(:,1), dual_left_acc(:,3), 'rs-');
hold on;
plot(dual_right_acc(:,1), dual_right_acc(:,3), 'b*-');
grid on;
legend('left', 'right');
title('dual-acc');



%%%%  delta-theta

SLIDE_WINDOWS_WIDTH = 3;

origin_size = min(min(size(origin_left_att, 1), size(origin_left_acc, 1)), ...
    min(size(origin_right_att, 1), size(origin_right_acc, 1))) - SLIDE_WINDOWS_WIDTH;

delta_origin_left_att = zeros(origin_size, 3);
delta_origin_left_acc = zeros(origin_size, 3);
delta_origin_left_gyro = zeros(origin_size, 3);
delta_origin_left_t = zeros(origin_size, 1);

delta_origin_right_att = zeros(origin_size, 3);
delta_origin_right_acc = zeros(origin_size, 3);
delta_origin_right_gyro = zeros(origin_size, 3);
delta_origin_right_t = zeros(origin_size, 1);

% origin_left_att & origin_left_acc
% origin_right_att & origin_right_acc
for index = 1 : origin_size
    delta_origin_left_att(index, :) = sum(origin_left_att(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
    delta_origin_left_acc(index, :) = sum(origin_left_acc(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
    delta_origin_left_gyro(index, :) = sum(origin_left_gyro(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
    
    delta_origin_right_att(index, :) = sum(origin_right_att(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
    delta_origin_right_acc(index, :) = sum(origin_right_acc(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
    delta_origin_right_gyro(index, :) = sum(origin_right_gyro(index : (index + SLIDE_WINDOWS_WIDTH), :))/SLIDE_WINDOWS_WIDTH;
end

for index = 1 : origin_size -1
   delta_origin_left_acc(index, :) = delta_origin_left_acc(index + 1, :) - delta_origin_left_acc(index, :); 
   delta_origin_left_t(index) = sum(delta_origin_left_gyro(index, :)) / sum(delta_origin_left_att(index, :));
   
   delta_origin_right_acc(index, :) = delta_origin_right_acc(index + 1, :) - delta_origin_right_acc(index, :);
   delta_origin_right_t(index) = sum(delta_origin_right_gyro(index, :)) / sum(delta_origin_right_att(index, :));
end


origin_left_dt = sum(delta_origin_left_t) / (size(delta_origin_left_t, 1)-1);
origin_right_dt = sum(delta_origin_right_t) / (size(delta_origin_right_t, 1)-1);

origin_left_vec = delta_origin_left_acc .* origin_left_dt;
origin_right_vec = delta_origin_right_acc .* origin_right_dt;

(origin_left_vec ./ 0.03) - delta_origin_left_gyro


