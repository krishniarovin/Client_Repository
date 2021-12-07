update ClntFranchise set EndEffDate= dateadd(dd,-1,getdate())
where
ClntID='89142 ' and ClntFranchiseNum='2207420001'

go