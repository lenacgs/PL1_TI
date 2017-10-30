function  pl1_ex6c()

%alfabetos sao iguais
[query, ~, ~, alf] = infoSom('guitarSolo.wav');
[target1, ~, ~, ~] = infoSom('Song01.wav');
[target2, ~, ~, ~] = infoSom('Song02.wav');
[target3, ~, ~, ~] = infoSom('Song03.wav');
[target4, ~, ~, ~] = infoSom('Song04.wav');
[target5, ~, ~, ~] = infoSom('Song05.wav');
[target6, ~, ~, ~] = infoSom('Song06.wav');
[target7, ~, ~, ~] = infoSom('Song07.wav');


i1 = infoMutuaSom(alf, query, target1);
plot(i1);
title('mutual information: target1 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 0.07]);
figure;
i1 = i1(i1~=Inf);
[max1, ~] = max(i1(:));

i2 = infoMutuaSom(alf, query, target2);
plot(i2);
title('mutual information: target2 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 0.03]);
figure;
i2 = i2(i2~=Inf);
max2 = max(i2(:));

i3 = infoMutuaSom(alf, query, target3);
plot(i3);
title('mutual information: target3 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 0.08]);
figure;
i3 = i3(i3~=Inf);
max3 = max(i3(:));

i4 = infoMutuaSom(alf, query, target4);
plot(i4);
title('mutual information: target4 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 0.2]);
figure;
i4 = i4(i4~=Inf);
[max4, ~] = max(i4(:));

i5 = infoMutuaSom(alf, query, target5);
plot(i5);
title('mutual information: target5 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 6]);
figure;
i5 = i5(i5~=Inf);
max5 = max(i5(:));

i6 = infoMutuaSom(alf, query, target6);
plot(i6);
title('mutual information: target6 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 25]);
figure;
i6 = i6(i6~=Inf);
max6 = max(i6(:));

i7 = infoMutuaSom(alf, query, target7);
plot(i7);
title('mutual information: target7 & query');
xlabel('time');
ylabel('mutual information');
ylim([0, 18]);
i7 = i7(i7~=Inf);   
max7 = max(i7(:));

maxs = [max1 max2 max3 max4 max5 max6 max7];
maxs = sort(maxs, 'descend');
disp('mutual information in descending order');
disp(maxs);




end

