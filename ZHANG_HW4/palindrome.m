function str = palindrome(s)
% palindrome takes a string s and returns a string
% telling whether or not s is a palindrome.

% makes s all lowercase, removes spaces, and removes
% all non-letter elements from s
s = lower(s);
s = s(~isspace(s));
s = s(isletter(s));

% checks if s is equal to s flipped from left to right.
% if so, returns string that alerts the user that s is
% a palindrome. if not, returns string that alerts user
% that s is not a palindrome.
if s == fliplr(s)
    str = 'your sentence is a palindrome';
else
    str = 'your sentence is not a palindrome';
end

end