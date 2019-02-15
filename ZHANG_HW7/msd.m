function dy = msd(t,y,c,k,m)
%differential equations

%preallocating dy(1,2)
dy=zeros(2,1);
%setting the differential equations corresponding to
%the given equations
dy(1)=y(2);
dy(2)=(-c.*y(2)-k.*y(1))./m;

end