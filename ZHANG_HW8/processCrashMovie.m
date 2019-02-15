function processCrashMovie(movieFile,saveName,win)

% a) Load the video and place all video frames in a 
% cell array.
videoObject = VideoReader(movieFile);
numFrames = videoObject.NumberOfFrames;

%vidFrames=readFrame(videoObject);
%nFrames = videoObject.CurrentTime;

width = videoObject.Width;
ht = videoObject.Height;

wCom = []; hCom = [];

% b) Have the user select, via mouse input, the 
% approximate location of the center of mass in the 
% first frame of the video.

for i=1:numFrames
    img=read(videoObject,i);
    if i == 1
        figure(1),imshow(img,[]);
        [w,h] = ginput(1);
        wCom(end+1)=w; hCom(end+1)=h;
    end
    
    %ideal
    if h+win <= ht && h-win > 0 && ...
            w+win <= width && w-win > 0
        cropImg = img(round(h-win):round(h+win),...
            round(w-win):round(w+win),:);
    %far up    
    elseif w+win <= width && w-win > 0 && ...
            h < win
        cropImg = img(1:win,w-win:w+win,:);
    %far down
    elseif w+win <= width && w-win > 0 && ...
            h+win > ht
        cropImg = img(ht-win:ht,w-win:w+win,:);
    %far right
    elseif h+win <= ht && h-win > 0 && ...
            w+win > width
        cropImg = img(h-win:h+win,width-win:width,:);
    %far left
    elseif h+win <= ht && h-win > 0 && ...
            w < win
        cropImg = img(h-win:h+win,1:win,:);
    end
    
    figure(1),imshow(cropImg,[],'InitialMagnification',200);
    [w2,h2] = ginput(1);
    hN = h+h2; h = h+h2-win; 
    wN = w+w2; w = w+w2-win; 
    wCom(end+1)=wN;hCom(end+1)=hN;
    
end

%hCom(1:end)=hCom(end:-1:1);
hCom = hCom-hCom(1);
hCom(2:end) = hCom(2:end) - win;
wCom = wCom-wCom(1);
wCom(2:end) = wCom(2:end) - win;

save(saveName,'wCom','hCom');

end
