function ErgyDetectionRayChannel()
%% This funciton is used to calculate the Energy of a Rayleigh Fading
% Channel
clc;
% clear all;

L = 10; % Number of sensing samples to be taken
snr_db = 20; % Average SNR in decibel for Rayleigh channel

snr = 10.^(snr_db./10);
thresh = 0:0.01:100; % Threhsold

Pf= 1- gammainc(thresh./2, L./2); % Calculation of probability of false alarm
pd = [];

A = snr./(1 + snr);
u = L./2; % Time-Bandwidth product

for pp = 1:length(Pf)
    
    n = 0:1:u-2;
    term_sum1 = sum((1./factorial(n)).*(thresh(pp)./2).^(n));
    term_sum2 = sum((1./factorial(n)).*(((thresh(pp)./2).*(A)).^(n)));
    pd(pp) = exp(-thresh(pp)./2).*term_sum1 + (1./A).^(u-1).*(exp(-thresh(pp)./(2.*(1+snr))) - exp(-thresh(pp)./2).*term_sum2); % Probability of detection
    
end

figure;
loglog(Pf,1-pd,'r') % ROC curve
title('ROC - Prob. of False Alarm vs Prob. of Detection');
grid on
xlim([10^-4 1])
ylim([10^-5 1])

end