/*
Pls. run this SQL after completing First Two Files Insert Statement
Purpose of this SQL is to Add the Conv Loan Type for all the Exiting Rules which has VA or/And FHA.

*/

Insert into dbo.BusSrcStateLicenseInfo
select distinct ClassNum,'CONV',StateCd,'09/06/2007','12/31/2099',user,'09/06/2007',user,'09/06/2007'
from dbo.BusSrcStateLicenseInfo
Where LoanType <> 'CONV'



