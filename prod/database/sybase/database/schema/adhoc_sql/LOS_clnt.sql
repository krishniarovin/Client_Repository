update Client
set EndEffDate = '12/31/2099'
where ClntID in 
('82663', '13579'  , '80465') 

go

update PHHManager 
set EndEffDate = '12/31/2099'
where PersIDNum = 723921 ; 



