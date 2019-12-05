rosshutdown;
ipaddress = "192.168.174.130";
rosinit(ipaddress,'NodeHost','192.168.160.1')
gazebo = ExampleHelperGazeboCommunicator;
model = rospublisher('/gazebo/set_model_state') ;
quat2 = eul2quat([0.16514868 + (pi/2) 0 0]);
quat3 = eul2quat([(3*pi/2)-1.45368758 0 0]);
quat4 = eul2quat([(3*pi/2)+0.58337301 0 0]);
quat1 = eul2quat([0 0 0]);
quat_bot = eul2quat([(pi/2)-0.4 0 0]);
move_bot = rosmessage(model);
move_bot.ModelName = 'mobile_base';
move_bot.ReferenceFrame = 'world';
move_bot.Pose.Position.Y = -3.5;
move_bot.Pose.Orientation.Z = quat_bot(1);
move_bot.Pose.Orientation.W = quat_bot(4);
send(model, move_bot);
human = ExampleHelperGazeboModel('person_standing','gazeboDB');
spawnModel(gazebo,human,[0 0 0]);
tic
move = rosmessage(model);
move.ModelName = 'person_standing';
move.ReferenceFrame = 'world';
%quat2 = eul2quat([5*pi/8 0 0]);

j = 0.0;
i = 0.0;
while j<15.0
    disp("first");
    j = j+1.0;
    move.Pose.Position.Y = j;
    move.Pose.Position.X = i;
    disp(i);
    disp(j);
    move.Pose.Orientation.Z = quat1(1);
    move.Pose.Orientation.W = quat1(4);
    pause(2);
    send(model, move);

end
while i<5.0
    disp("second");
    i = i+0.9868;
    j = j-0.16447;
    move.Pose.Position.Y = j;
    move.Pose.Position.X = i;
    disp(i);
    disp(j);
    move.Pose.Orientation.Z = quat2(1);
    move.Pose.Orientation.W = quat2(4);
    pause(2);
    send(model, move);
end
while i>4.0
    disp("third");
    i = i-0.1;
    j = j-0.86;
    move.Pose.Position.Y = j;
    move.Pose.Position.X = i;
    disp(i);
    disp(j);
    move.Pose.Orientation.Z = quat3(1);
    move.Pose.Orientation.W = quat3(4);
    pause(2);
    send(model, move);
end

while i>0.0
    disp("fourth");
    i = i-0.65345861064;
    j = j+0.47220948234;
    move.Pose.Position.Y = j;
    move.Pose.Position.X = i;
    disp(i);
    disp(j);
    move.Pose.Orientation.Z = quat4(1);
    move.Pose.Orientation.W = quat4(4);
    pause(2);
    send(model, move);
end
t = toc;
time = sum(t);
disp(t);