function [pName,db] = checkOut(pNumber,dbt)
% checkOut takes a scalar pNumber and a cell array dbt
% and returns the modified scalar pName and cell array
% db.

% e stores pNumber
    e=pNumber;
% takes first column of dbt and stores its transpose in
% w
    w=dbt(:,1)';
% finds index of pNumber in w
    index = find([w{:}] == e);
% subtracts 1 from product's inventory 
    c=dbt{index,2}-1;
% replaces new inventory cell into dbt 
    dbt(index,2)={c};
    db=dbt
% removes last five letters from dbt and stores new
% product name into pName
    pName=dbt{index,3};
    pName=pName(1:end-5);
end

