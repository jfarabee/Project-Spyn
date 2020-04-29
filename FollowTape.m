%FollowTape.m written by Jacob Farabee
%4/2/20

%Assuming brick is already connected

midpoint = 0;   %???

%set color sensor to RGB
brick.SetColorMode(4, 4);

%take initial color reading
color_rgb = brick.ColorRGB(4);

%color_rgb is a 3-value row vector

while(1)
    color_rgb = brick.ColorRGB(4);
    if ((color_rgb(1) < 40) && (color_rgb(2) < 40) && (color_rgb(3) < 40))
        %i.e. while color is black, all RGB should be < 40
        %move forward at 25 speed
        brick.MoveMotor('A', -28);
        brick.MoveMotor('B', -25);
    elseif ((color_rgb(3) > 200) && (color_rgb(2) < 40) && (color_rgb(1) < 40))
        %when color blue is spotted, we rotate the pickup motor 45 degrees
        % 'up', to pickup the passenger
        amt = 0;
        while amt < 45
            brick.MoveMotor('C' , 10);
            amt = amt + 1;
        end
    elseif ((color_rgb(1) > 200) && (color_rgb(2) < 40) && (color_rgb(3) < 40))
        %on red, stop for 4 seconds
        pause(4);
    else
       brick.MoveMotor('A', -30);
       brick.MoveMotor('B', -10);
    end
    
    
    %DROPOFF BEHAVIOR NEEDS IMPLEMENTATION
end