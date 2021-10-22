create database AlbumDelleBand;

create table Brano(
IDBrano int not null identity(1,1),
Titolo nvarchar(30) not null,
Durata int not null,
constraint PK_Brano primary key (IDBrano)
);

create table Band(
IDBand int not null identity(1,1),
Nome nvarchar(30) not null,
NumeroComponenti int not null check(NumeroComponenti>0),
constraint PK_Band primary key (IDBand)
);

create table Album(
IDAlbum int not null identity(1,1),
TitoloAlb nvarchar(30) not null,
AnnoUscita int not null,
CasaDiscografica nvarchar(30) not null,
Genere nvarchar(20) not null,
Supporto nvarchar(20) not null,
constraint PK_Album primary key (IDAlbum),
unique(TitoloAlb, AnnoUscita,CasaDiscografica,Genere,Supporto),
IDBand int not null constraint FK_Band foreign key references Band(IDBand)
);

create table AlbumBrano(
IDAlbum int not null,
IDBrano int not null,
constraint FK_Album foreign key (IDAlbum) references Album(IDAlbum),
constraint FK_Brano foreign key (IDBrano) references Brano(IDBrano),
constraint PK_AlbumBrano primary key (IDAlbum,IDBrano)
);


--inserimento dati
insert into Brano values('Dura Legge Del Gol',200);
insert into Brano values('Lunga Estate Caldissima',220);
insert into Brano values('Regina Del Celebrita',300);
insert into Brano values('Regola Dell''Amico',180);
insert into Band values('883',5);
insert into Band values('Queen',5);
insert into Band values('Maneskin',4);
insert into Album values('Hanno ucciso Uomo Ragno', 1992 ,'FriRecords','pop','CD',1);
insert into Album values('La donna il sogno',1995,'FriRecords','pop','CD',1);
-- verificare funzionamento di unique(funziona)
insert into Album values('Hanno ucciso Uomo Ragno', 1992 ,'FriRecords','pop','Vinile',1);
insert into Album values('La dura legge del gol',1997,'FriRecords','pop','Vinile',1);
insert into Album values('Grazie mille',1999,'S4','pop','CD',1);
insert into Album values('Il ballo della vita',2018,'Sony','rock','CD',3);
insert into Album values('Teatro d''ira',2021,'Sony','rock','Straming',3);
insert into Album values('giornalisti',2016,'Sony','pop','Straming',4);
insert into Brano values('New Song',203);
insert into Brano values('Torna a casa',280);
insert into Brano values ('Immortale',150);
insert into Brano values('Moriro da re',157);
insert into Brano values('Siamo tutti marziani',300);
insert into Brano values('Mare Balotelli',180);
insert into Brano values ('Fine dell''estate',120);
insert into Brano values(' Tra la strada e le stelle',112);
insert into Brano values('Il tuo maglione mio',190);
insert into Band values('The giornalisti',4);
insert into AlbumBrano values(8,13)
insert into AlbumBrano values(8,12)
insert into AlbumBrano values(8,11)
insert into AlbumBrano values(8,10)
insert into AlbumBrano values(8,9)
insert into AlbumBrano values(6,5)
insert into AlbumBrano values(6,6)
insert into AlbumBrano values(6,7)	
insert into AlbumBrano values(6,8)
insert into AlbumBrano values(1,1)
insert into AlbumBrano values(2,2)
insert into AlbumBrano values(3,3)	
insert into AlbumBrano values(4,4)
insert into Band values('Beatles',6)
insert into Brano values('Imagine',180)
insert into Album values('Imagine',1971,'Sony','rock','Vinile',5)
insert into AlbumBrano values(9,19)
insert into Album values('Immagina',1990,'Sony','rock','CD',5)
insert into Album values('Imagine modern version',2020,'Sony','rock','Straming',5)
insert into AlbumBrano values(10,19)
insert into AlbumBrano values(11,19)
insert into Brano values('I want to break free',180)
insert into Brano values('Bicycle',180)

--elenco query

--query 1
select a.*
from Album a join Band b on b.IDBand=a.IDBand
where b.Nome='883'
order by a.TitoloAlb;

--query 2
select *
from Album a
where a.CasaDiscografica='Sony' and a.AnnoUscita=2020;

--query 3
select b.Titolo
from Album a join AlbumBrano ab on a.IDAlbum=ab.IDAlbum
     join Brano b on b.IDBrano=ab.IDBrano 
	 join Band bb on bb.IDBand=a.IDBand
where a.AnnoUscita<2020 and bb.Nome='Maneskin';

--query 4
select a.*
from Album a join AlbumBrano ab on a.IDAlbum=ab.IDAlbum
     join Brano b on b.IDBrano=ab.IDBrano
where (b.Titolo='Imagine');

--query 5
select count(b.Titolo) as [Numero Canzoni The giornalisti]
from Brano b join AlbumBrano ab on ab.IDBrano=b.IDBrano
     join Album a on a.IDAlbum=ab.IDAlbum
	 join Band bb on a.IDBand=bb.IDBand
where bb.Nome='The giornalisti';

--query 6
select sum(b.Durata) as [Somma durata], a.TitoloAlb as [Album corrispondente]
from Album a join AlbumBrano ab on ab.IDAlbum=a.IDAlbum
     join Brano b on b.IDBrano=ab.IDBrano
group by a.TitoloAlb;

--query 7
select distinct b.*
from Brano b join AlbumBrano ab on ab.IDBrano=b.IDBrano
     join Album a on a.IDAlbum=ab.IDAlbum
	 join Band bb on a.IDBand=bb.IDBand
where bb.Nome='883' and b.Durata>180;

--query 8
select b.Nome
from Band b
where left(b.Nome,1)='M' and right(b.Nome,1)='n'

--query 9
select a.TitoloAlb, a.AnnoUscita,
case
when a.AnnoUscita<1980 then 'Very Old'
when a.AnnoUscita=2021 then 'New Entry'
when a.AnnoUscita>=2010 or a.AnnoUscita<=2020 then 'Recente'
else 'Old'
end as [Album]
from Album a;

--query 10
select b.*
from Brano b 
where b.IDBrano not in (select b.IDBrano from Brano b join AlbumBrano ab on ab.IDBrano=b.IDBrano);








