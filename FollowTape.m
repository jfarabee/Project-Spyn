%FollowTape.m written by Jacob Farabee
%4/2/20

%Assuming brick is already connected

%set color sensor to RGB
brick.SetColorMode(4, 4);

%take initial color reading
color_rgb = brick.ColorRGB(4);

%color_rgb is a 3-value row vector

halfway = 0;
%tracks whether car has hit halfway point of track

while(1)
    
    color_rgb = brick.ColorRGB(4);
    if ((color_rgb(1) > 200) && (color_rgb(2) > 200) && (color_rgb(3) < 40))
        %START ON YELLOW - high red, high green, low blue
        brick.MoveMotor('A', -28);
        brick.MoveMotor('B', -25);
    elseif ((color_rgb(1) < 40) && (color_rgb(2) < 40) && (color_rgb(3) < 40))
        %MOVE FORWARD ON BLACK - low all colors
        %speeds are not equal, motors have tendency to veer one direction
        brick.MoveMotor('A', -28);
        brick.MoveMotor('B', -25);
    elseif ((color_rgb(3) > 200) && (color_rgb(2) < 40) && (color_rgb(1) < 40))
        %PICKUP ON BLUE - high blue, low other colors
        %since normal rotation degree methods were giving an error, we use
        % a 'timed' while loop
        amt = 0;
        while amt < 45
            brick.MoveMotor('C' , 10);
            amt = amt + 1;
        end
    elseif ((color_rgb(3) > 200) && (color_rgb(2) < 40) && (color_rgb(1) < 40))
        %PICKUP ON BLUE - high blue, low other colors
        %since normal rotation degree methods were giving an error, we use
        % a 'timed' while loop
        amt = 0;
        while amt < 45
            brick.MoveMotor('C' , -10);
            amt = amt + 1;
        end
    elseif ((color_rgb(1) > 200) && (color_rgb(2) < 40) && (color_rgb(3) < 40))
        %STOP ON RED - pause for 4 seconds on red
        pause(4); halfway = 1;
    else
        
        %turn movement behavior depends on which half of the track the car
        %is on - past halfway, the car should turn left instead of right
        
       if halfway == 1
           brick.MoveMotor('A', -10);
           brick.MoveMotor('B', -30);
       else
           brick.MoveMotor('A', -30);
           brick.MoveMotor('B', -10);
       end
    end
    
    
    %DROPOFF BEHAVIOR NEEDS IMPLEMENTATION
end