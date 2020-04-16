%CalibrateColor.m written by Jacob Farabee
%4/16/20

%assuming brick is connected

brick.SetColorMode(4,4);

%constantly update and display RGB vector:
while(1)
    color_rgb = brick.ColorRGB(4);
    display(color_rgb)
end