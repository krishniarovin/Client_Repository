--BRANDS--
update Classification
set BusSrcClass = 'BRANDS'
where ClassNum not in (27, 28, 42, 60, 64, 77, 78, 79, 274,
105, 106,
201, 202,
237, 238,
253, 254,
260, 261,
262, 263,
211, 212,
256, 257,
281, 282,
279, 280,
277, 278,
283, 284,
305, 306,
309, 310,197, 198, 207, 208,199, 200) and ClassGrpIDNum = 3;

--PLS--

update Classification
set BusSrcClass = 'PLS'
where ClassNum in (27, 28, 42, 60, 64, 77, 78, 79, 274,
105, 106,
201, 202,
237, 238,
253, 254,
260, 261,
262, 263,
211, 212,
256, 257,
281, 282,
279, 280,
277, 278,
283, 284,
305, 306,
309, 310
) and ClassGrpIDNum = 3;

--NT--

update Classification
set BusSrcClass = 'NT'
where ClassNum in (197, 198, 207, 208) and ClassGrpIDNum = 3;

--Schwab--

update Classification
set BusSrcClass = 'SCHWAB'
where ClassNum in (199, 200) and ClassGrpIDNum = 3;