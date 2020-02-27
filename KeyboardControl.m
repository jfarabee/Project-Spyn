%KeyboardControl.m written by Jacob Farabee
%2/27/2020  for FSE200 w/ Dr. Chavez

%brick = ConnectBrick("12BRICKS");

global key
InitKeyboard();

while 1
    pause(0.1);
    switch key
        case 'uparrow'
            brick.MoveMotor('AB', -20);
        case 'downarrow'
            brick.MoveMotor('AB', 20);
        case 'leftarrow'
            brick.MoveMotor('A', -20);
        case 'rightarrow'
            brick.MoveMotor('B', -20);
        case 'l'
            brick.MoveMotor('C', -4);
        case 'k'
            brick.MoveMotor('C', 4);
        case 'q'
            break;
        otherwise
            brick.StopAllMotors();
    end
end

CloseKeyboard();