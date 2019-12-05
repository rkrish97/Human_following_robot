rosshutdown;
ipaddress = "192.168.174.130";
rosinit(ipaddress,'NodeHost','192.168.160.1')
r = rospublisher('/mobile_base/commands/velocity');
vel = rosmessage(r);
dist = 1;
count = 0;
n = 1;
n2 = 1;
t = zeros(1,500);
c = zeros(1,500);
e = 0;
start = tic;
while e<96
    try
        loop = tic;
        imsub = rossubscriber('/camera/rgb/image_raw');
        img = receive(imsub);
        image = readImage(img);
        frame_x = 320;
        frame_y = 240;
        peopleDetector = vision.PeopleDetector;
        [bboxes, scores] = peopleDetector(image);
        %score = 1-scores;
        vel.Linear.X = 0.6;
        points = bbox2points(bboxes);
        centre_x = (points(1) + points(2))/2;
        centre_y = (points(1,2) + points(3,2))/2;
        imshow(image);
        hold on;
        rectangle('Position', bboxes);

        hold on;
        %rectangle('Position', bboxes);
        plot(centre_x, centre_y, 'ro', 'MarkerSize', 15);
        plot(frame_x, frame_y,'ro', 'MarkerSize', 15);
        dist = centre_x-frame_x;
        angle = -((dist/8)*3.14159265359)/180;
        vel.Angular.Z = angle;
        %t = timer('StartDelay', 2, 'TimerFcn', @(~,~)send(r,vel));
        %start(t);
        send(r,vel);
        t(n) = toc(loop);
        n = n+1;
    
    catch
        loop_catch = tic;
        count = count + 1;
        vel.Angular.Z = -0.2;
        vel.Linear.X = 0.0;
        send(r,vel);
        c(n2) = toc(loop_catch);
        n2 = n2+1;
    end
    s = sum(t);
    d = s*0.6;
    %disp(d);
    e = toc(start);
end
s2 = sum(c);
disp(s2);
excel = {4,-3,0,d, count, s2};
disp(d);
disp(count);
writecell(excel, 'C:\Users\rahul\OneDrive\Desktop\ambient.xls', 'Range', 'A4:F4');