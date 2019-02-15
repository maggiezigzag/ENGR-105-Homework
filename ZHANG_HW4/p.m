function Lp = p(n,x)
% Lp takes scalars n and x and returns the legendre 
% polynomial associated with n and x.

% if n is 0, the legendre polynomial is always equal to
% 1. if n is 1, the legendre polynomial is always equal
% to x. in all other cases, the general recurrence
% formula is used to compute the value of Lp.
if n == 0
    Lp = 1;
elseif n == 1
    Lp = x;
else
    Lp = (((2*n-1)*x*p(n-1,x))-((n-1)*p(n-2,x)))/n;
end

end

