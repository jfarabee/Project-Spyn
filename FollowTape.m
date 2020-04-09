%FollowTape.m written by Jacob Farabee
%4/2/20

%Assuming brick is already connected

midpoint = 0;   %???

brick.setColorMode(4, 4);

color_rgb = brick.ColorRGB(4);

while(1)
    color_rgb = brick.ColorRGB(4);
    if mean(color_rgb) > 130
        %i.e. while color is black, grey.
        brick.MoveMotor('A', -25);
        brick.MoveMotor('B', -25);
    else
        path_not_found = true;
        while path_not_found
            %to find the path again, swing right looking for it
            brick.MoveMotor('A', -25);
            brick.MoveMotor('B', 0);
            color_rgb = brick.ColorRGB(4);
            if mean(color_rgb) > 130
                path_not_found = false;
            end
            
            brick.MoveMotor('A', 0);
            brick.MoveMotor('B', -125);
            color_rgb = brick.ColorRGB(4);
            if mean(color_rgb) > 130
                path_not_found = false;
            end
        end
    end
end