%FollowTape.m written by Jacob Farabee
%4/2/20

%Assuming brick is already connected

midpoint = 0;   %???

%set color sensor to RGB
brick.setColorMode(4, 4);

%take initial color reading
color_rgb = brick.ColorRGB(4);

%color_rgb is a 3-value row vector

while(1)
    color_rgb = brick.ColorRGB(4);
    if mean(color_rgb) < 130
        %i.e. while color is black, grey.
        %move forward at 25 speed
        brick.MoveMotor('A', -25);
        brick.MoveMotor('B', -25);
    else
        %if color is not black, brightness below certain value
        path_not_found = true;
        while path_not_found
            %to find the path again, swing right looking for it
            brick.MoveMotor('A', -25);
            brick.MoveMotor('B', 0);
            %take another color value from sensor
            color_rgb = brick.ColorRGB(4);
            if mean(color_rgb) < 130
                path_not_found = false;
            end
            
            %now swing right looking for track
            brick.MoveMotor('A', 0);
            brick.MoveMotor('B', -25);
            color_rgb = brick.ColorRGB(4);
            if mean(color_rgb) < 130
                path_not_found = false;
            end
        end
    end
end