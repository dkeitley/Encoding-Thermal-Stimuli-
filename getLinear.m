function h = getLinear(temp,spikes)

    [auto_cor1,auto_cor2] = corrmtx(temp,0);
    [cross_cor,lag] = xcorr(temp,spikes);
    h = inv(auto_cor2)*cross_cor;

end