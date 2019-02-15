%% Problem 2
function c = cosine_rule(a,b,theta) 
    % for loop iterates for three sets of numbers 
    for setNumber = 1:3
        % prompts user for inputs
        prompt1 = 'Length of first side: ';
        a = input(prompt1);
        prompt2 = 'Length of second side: ';
        b = input(prompt2);
        prompt3 = 'Angle in degrees: ';
        theta = input(prompt3);
        % cosine rule equation
        c = sqrt(a^2 + b^2 - 2*a*b*cos(theta));
        disp(c)
    end
end