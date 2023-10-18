   DROP TABLE icc_world_cup;

create table icc_world_cup
(
match_no int,
team_1 Varchar(20),
team_2 Varchar(20),
winner Varchar(20)
);
INSERT INTO icc_world_cup values(1,'ENG','NZ','NZ');
INSERT INTO icc_world_cup values(2,'PAK','NED','PAK');
INSERT INTO icc_world_cup values(3,'AFG','BAN','BAN');
INSERT INTO icc_world_cup values(4,'SA','SL','SA');
INSERT INTO icc_world_cup values(5,'AUS','IND','IND');
INSERT INTO icc_world_cup values(6,'NZ','NED','NZ');
INSERT INTO icc_world_cup values(7,'ENG','BAN','ENG');
INSERT INTO icc_world_cup values(8,'SL','PAK','PAK');
INSERT INTO icc_world_cup values(9,'AFG','IND','IND');
INSERT INTO icc_world_cup values(10,'SA','AUS','SA');
INSERT INTO icc_world_cup values(11,'BAN','NZ','NZ');
INSERT INTO icc_world_cup values(12,'PAK','IND','IND');


select * from icc_world_cup

with all_matches as(
select team, sum(matches_played) as matches_played from
(
select team_1 as team, count(*) as matches_played from icc_world_cup group by team_1
union all
select team_2 as team, count(*) as matches_played from icc_world_cup group by team_2)A
group by team
)

, winners as (
select winner, count(*) as wins from icc_world_cup group by winner
)

select m.team, m.matches_played, coalesce(w.wins,0) as wins, m.matches_played-coalesce(w.wins,0) as losses 
,coalesce(w.wins,0)*2 as points
from  all_matches m
left join winners w on m.team = w.winner
order by wins desc












