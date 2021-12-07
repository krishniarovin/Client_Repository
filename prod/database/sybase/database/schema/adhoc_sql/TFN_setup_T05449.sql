update TollFreeNumber 
set TollFreeTypeNum = 98 ,
State = 'WY'
where TollFreeNum = '8002105915'
and (((TollFreeNumber.AssignableId = 'Y') AND 
TollFreeNumber.EndEffDate >= Getdate())OR 
((DateAdd(dd,365,TollFreeNumber.EndEffDate) <= Getdate()) AND 
(TollFreeNumber.AssignableId = 'N')))

go 
