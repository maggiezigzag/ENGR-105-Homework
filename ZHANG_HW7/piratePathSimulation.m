function piratePathSimulation(map,nSimulations,rations)
%function finding the best starting latitude for ship
%navigation

load('knownMap.mat');

%setting the number of successes for each latitude to
%'counter'
counter=zeros(1,size(map,1));
% loop through all the latitudes
for i=1:size(map,1)  
    %setting the number of succeses to 0 at the start
    numSuccess=0;
    %setting the x and y starting positions of the ship
    yPos=i;
    xPos=size(map,2);
%     loop through #simulations for each latitude
    for j=1:nSimulations
%         reset x and y pos and turns
        yPos=i;
        xPos=size(map,2);
        %setting number of ship moves/turns to 0
        turns=0;
        %looping until the ship reaches the port
        while xPos>1
            %adding one move/turn per loop that the
            %ship isn't in port
            turns=turns+1; 
            %moves ship west if there is water 
            if map(yPos,xPos-1)==0    
                xPos=xPos-1;
            %does a random number generator for moving
            %ship east, north, or south if west is
            %blocked by land
            else
                %keeps going until ship moves
                movement=false;
                while movement==false
                    move=randi(3);
                    %checks if ship can move north, and
                    %moves if yes
                    if move==1
                        if  yPos+1<=size(map,1) && map(yPos+1,xPos)==0
                            yPos=yPos+1;
                            movement=true;
                        end
                    %checks if ship can move east, and
                    %moves if yes
                    elseif move==2
                        if xPos+1<=size(map,2) && map(yPos,xPos+1)==0 
                            xPos=xPos+1;
                            movement=true;
                        end
                    %checks if ship can move south, and
                    %moves if yes
                    else
                        if yPos-1>0 && map(yPos-1,xPos)==0
                            yPos=yPos-1;
                            movement=true;
                        end
                    end
                end
            end  
            
        end
      %sets condition such that if number of turns was
      %less than or equal to number of rations,
      %successes gets increased by 1
        if turns<=rations
            numSuccess=numSuccess+1;
        end
    end
%    updates number of successes for each y coordinate 
    counter(i)=numSuccess;
end
%sets bar graph of results
bar(counter);
%sets x limit of axes
xlim([1,size(map,1)]);
%sets x/y labels and title
xlabel('Latitude (row) entrance point');
ylabel({'Number of times';'port was reached';'in 150 simulations'});
title('MapQuest')

end