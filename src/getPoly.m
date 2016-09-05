function [p,dp,tvec] = getPoly(temp,deg)
    tvec = [0:size(temp)-1]'*5*10^-5;
    p = polyfit(tvec,temp,deg);
    dp = polyder(p);
end