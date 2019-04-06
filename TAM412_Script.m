w = linspace(0,25,500);
F = sin(w)*(cos(w-(pi/4)) - w*sin(w-(pi/4)))/(w*w*(cos(w-(pi/4))) +cos(w-(pi/4)) -w*sin(w-(pi/4)));
plot(F,w);
print -dpng;