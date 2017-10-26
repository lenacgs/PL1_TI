function [ output_args ] = pl1_ex6bv2( input_args )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[query, freqQuery, nBitsQuery, alf] = infoSom('guitarSolo.wav');
[target01, freqTarget01, nBitsTarget01, ~] = infoSom('target01 - repeat.wav');
[target02, freqTarget02, nBitsTarget02, ~] = infoSom('target02 - repeatNoise.wav');

query = query(:);
target01 = target01(:);
target02 = target02(:);

query = query * 2^nBitsQuery;
target01 = target01 * 2^nBitsTarget01;
target02 = target02 * 2^nBitsTarget02;

disp(query);
disp('fim do query');

step = round(length(query) / 4);

informacaoMutua(query, target01, step, alf);

end

