--To set the Question 23 A indicator as Y for clients belonging to 
--business source 287(Goldman), 199 (Schwab) and 200 (Schwab Inv) 

Update Client
set Question23_ind = 'Y' 
where ClntID in ('19379','19380','19381','15964','15965','15966','15967','15972','16141','16142','16107','16115','16218','15968','15969','15970','15971','15973','16108','16116','16143','16144','16145','16278','70172')

