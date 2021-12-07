update PHHManager set EndEffDate='12/31/2099 11:44:12.383 AM' 
where PersIDNum in
(select PersIDNum from Person where PersFullName in('Brendan Murphy' , 'Brian Mahrer' , 'Eric Vesotsky' , 'James Brotherton' , 'Karen Amico' , 'Kevin Dallahan',
'Mark Klayman' , 'Peter Brown' , 'Robert Mckeon') ) 
go
