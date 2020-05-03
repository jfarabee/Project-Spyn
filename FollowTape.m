%FollowTape.m written by Jacob Farabee
%4/2/20

%Assuming brick is already connected

%set color sensor to RGB
brick.SetColorMode(4, 4);

%take initial color reading
color_rgb = brick.ColorRGB(4);

%color_rgb is a 3-value row vector

halfway = 0; redSeen = 0;
%tracks whether car has hit halfway point of track

pickedUp = 0; droppedOff = 0;
%tracks stages of passenger delivery

while(droppedOff == 0)
    
    color_rgb = brick.ColorRGB(4);
    red = color_rgb(1); green = color_rgb(2); blue = color_rgb(3);
    
    if ((red > 35) && (green > 35) && (blue < 30))
        %START ON YELLOW - high red, high green, low blue
        brick.MoveMotor('A', -28);
        brick.MoveMotor('B', -25);
    elseif ((red < 20) && (green < 20) && (blue < 20))
        %MOVE FORWARD ON BLACK - low all colors
        %speeds are not equal, motors have tendency to veer one direction
        brick.MoveMotor('A', -28);
        brick.MoveMotor('B', -25);
    elseif ((red < 20) && (green < 20) && (blue > 35) && (pickedUp == 0))
        %PICKUP ON BLUE - high blue, low other colors
        %since normal rotation degree methods were giving an error, we use
        % a 'timed' while loop
        amt = 0;
        while amt < 45
            brick.MoveMotor('C' , 10);
            amt = amt + 1;
        end
        pickedUp = 1;
    elseif ((red < 5) && (green > 15))
        %DROPOFF ON GREEN - reverse motor movement of pickup
        amt = 0;
        while amt < 45
            brick.MoveMotor('C' , -10);
            amt = amt + 1;
        end
        droppedOff = 1;
    elseif ((red > 20) && (green < 15) && (blue < 15))
        %STOP ON RED - pause for 4 seconds on red
        if redSeen == 0
            pause(4); halfway = 1;
        end
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
end