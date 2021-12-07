---HDS#2048867
---Delete from OfficeBCS.


Delete from OfficeBCS where 
YearMonth = 200901
and convert(char(10),DateMdfd,101) = '02/14/2009'
and OfficeIDNum in 
(select b.OfficeIDNum from Office a,OfficeBCS b
where a.OfficeIDNum = b.OfficeIDNum
and b.YearMonth = 200901
and convert(char(10),b.DateMdfd,101) = '02/14/2009'
and a.FranchiseNum in ('0082580005','0082580012','2203410002',
'1210730001','2157180001','2105070002','0082580015','1201420001',
'1995410006','1210360008','0097150001','0098410001','3002520002',
'0082580018','1290090010','2201290005','2212170035','2011660026',
'2011420005','0080170001','0086050001','0020690004','0087630001',
'0082580006','0087110005','0082580013','0082580016','0093370001',
'1190220001','1210360007','1300300001','1450100001','1180320001',
'1461120001','1461120002','1340890010','2009680001','2011360001',
'2011420001','2103120001','2103550001','2155600001','2163010001',
'2170540001','2211940001','2212200001','2205840001','3000430001',
'2162290003','2170040005','3005600001','2163220020','2110330003',
'2126720021','2007120007','2110970004','2011660022','0027820001',
'0070000001','0076300001','0082580001','0082580002','0082580003',
'0082580004','0082580008','0035390005','0082580009','0082580010',
'0089610001','0082580011','1031350001','1080130001','1100330001',
'1460570001','1510120001','1461020001','1490740001','1032000002',
'1320190013','1300300002','1320200002','2007230002','2006650002',
'2100230001','2103550002','2110970001','2105850001','2109310001',
'2150140001','2164290004','2164490001','2201870002','2211340001',
'2203410001','0084130001','0049980002','0082580007','1999670001',
'1210360001','2165130001','2164290005','2126720010','2011420002',
'2159210006','3011200010','3011200012','0098110001','3011640001',
'0092300008','1992390003','2170040012','1290090009','5002430001',
'1201370002','1190450002','2163500006','2210880008','2220170003',
'3014250001','0082580019','2011420004','3008570001','2163310005',
'3011200011','0098850001','0097580001','1460090007','1340890016',
'1210360016','1210360017','3011030001','0092300006','0092300007',
'3015860001','2150140002','1330090018','2205680002','3002280006',
'0035390007','1340890014','1400510007','2150210004','3011200015',
'1991190006','1210360011','1996140001','1190320002','1340890001',
'1991660001','1490730003','1210360014','1210440003','1993680001',
'2207370001','2208650001','2208790001','2207780003','3002280003',
'3002660001','3002280004','3000430004','2002410003','3004150013',
'2010500007','2152320005','3014240001','1992100001','2000000001',
'0096040001','3014380001','3011200008','3008350001','3008920001',
'3009620001','3011200016','1992390008','1500300012','3011230001'))

