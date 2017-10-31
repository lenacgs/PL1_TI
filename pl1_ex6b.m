function pl1_ex6b()

[query, ~, ~, alf] = infoSom('guitarSolo.wav');
[target01, ~, ~, ~] = infoSom('target01 - repeat.wav');
[target02, ~, ~, ~] = infoSom('target02 - repeatNoise.wav');

i1 = infoMutuaSom(alf, query, target01);
subplot(2,1,1);
plot(i1);
ylim([0, 8]);
ylabel('mutual information');
xlabel('time');
title('mutual information: target01 & query');

i2 = infoMutuaSom(alf, query, target02);
subplot(2,1,2);
plot(i2);
ylim([0, 0.3]);
ylabel('mutual information');
xlabel('time');
title('mutual information: target02 & query');

end


