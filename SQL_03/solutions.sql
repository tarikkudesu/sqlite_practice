-- 4.1 Select the title of all movies.
select Title from Movies;
┌─────────────────────────┐
│          Title          │
├─────────────────────────┤
│ Citizen Kane            │
│ Singin  in the Rain     │
│ The Wizard of Oz        │
│ The Quiet Man           │
│ North by Northwest      │
│ The Last Tango in Paris │
│ Some Like it Hot        │
│ A Night at the Opera    │
└─────────────────────────┘
-- 4.2 Show all the distinct ratings in the database.
select distinct Rating from Movies where Rating is not null;
┌────────┐
│ Rating │
├────────┤
│ PG     │
│ G      │
│ NC-17  │
│ PG-13  │
└────────┘
-- 4.3  Show all unrated movies.
select * from Movies where Rating is null;
┌──────┬──────────────────────┬────────┐
│ Code │        Title         │ Rating │
├──────┼──────────────────────┼────────┤
│ 4    │ The Quiet Man        │        │
│ 5    │ North by Northwest   │        │
│ 8    │ A Night at the Opera │        │
└──────┴──────────────────────┴────────┘
-- 4.4 Select all movie theaters that are not currently showing a movie.
select * from MovieTheaters where Movie is null;
┌──────┬─────────────┬───────┐
│ Code │    Name     │ Movie │
├──────┼─────────────┼───────┤
│ 3    │ Majestic    │       │
│ 6    │ Nickelodeon │       │
└──────┴─────────────┴───────┘
-- 4.5 Select all data from all movie theaters. and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
select t.*, m.* from MovieTheaters t left join Movies m on t.Movie = m.Code;
┌──────┬─────────────┬───────┬──────┬─────────────────────────┬────────┐
│ Code │    Name     │ Movie │ Code │          Title          │ Rating │
├──────┼─────────────┼───────┼──────┼─────────────────────────┼────────┤
│ 1    │ Odeon       │ 5     │ 5    │ North by Northwest      │        │
│ 2    │ Imperial    │ 1     │ 1    │ Citizen Kane            │ PG     │
│ 3    │ Majestic    │       │      │                         │        │
│ 4    │ Royale      │ 6     │ 6    │ The Last Tango in Paris │ NC-17  │
│ 5    │ Paraiso     │ 3     │ 3    │ The Wizard of Oz        │ G      │
│ 6    │ Nickelodeon │       │      │                         │        │
└──────┴─────────────┴───────┴──────┴─────────────────────────┴────────┘
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
select m.*, t.* from MovieTheaters t right join Movies m on t.Movie = m.Code;
┌──────┬─────────────────────────┬────────┬──────┬──────────┬───────┐
│ Code │          Title          │ Rating │ Code │   Name   │ Movie │
├──────┼─────────────────────────┼────────┼──────┼──────────┼───────┤
│ 5    │ North by Northwest      │        │ 1    │ Odeon    │ 5     │
│ 1    │ Citizen Kane            │ PG     │ 2    │ Imperial │ 1     │
│ 6    │ The Last Tango in Paris │ NC-17  │ 4    │ Royale   │ 6     │
│ 3    │ The Wizard of Oz        │ G      │ 5    │ Paraiso  │ 3     │
│ 2    │ Singin  in the Rain     │ G      │      │          │       │
│ 4    │ The Quiet Man           │        │      │          │       │
│ 7    │ Some Like it Hot        │ PG-13  │      │          │       │
│ 8    │ A Night at the Opera    │        │      │          │       │
└──────┴─────────────────────────┴────────┴──────┴──────────┴───────┘
-- 4.7 Show the titles of movies not currently being shown in any theaters.
select m.* from MovieTheaters t right join Movies m on t.Movie = m.Code where t.Code is null;
┌──────┬──────────────────────┬────────┐
│ Code │        Title         │ Rating │
├──────┼──────────────────────┼────────┤
│ 2    │ Singin  in the Rain  │ G      │
│ 4    │ The Quiet Man        │        │
│ 7    │ Some Like it Hot     │ PG-13  │
│ 8    │ A Night at the Opera │        │
└──────┴──────────────────────┴────────┘
-- 4.8 Add the unrated movie "One, Two, Three".
insert into Movies(Code, Title) values (9, "One, Two, Three");
-- 4.9 Set the rating of all unrated movies to "G".
update Movies set Rating = "G" where Rating is null;
-- 4.10 Remove movie theaters projecting movies rated "NC-17".
delete from MovieTheaters where Movie in (select Code from Movies where Rating = 'NC-17');
