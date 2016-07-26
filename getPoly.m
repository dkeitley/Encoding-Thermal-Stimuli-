function [p,dp,tvec] = getPoly(temp,deg)
    tvec = [0:size(temp)-1]'*5*10^-5;
    p = polyfit(tvec,temp,deg);
    dp = polyder(p);
%     figure()
%     plot(polyval(p,[0:10]));
%     figure()
%     plot(polyval(dp,[0:10]));
end