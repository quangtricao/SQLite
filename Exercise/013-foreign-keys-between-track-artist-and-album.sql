-- Author: Tri Cao <tri.cao@tuni.fi>
-- Date: 2022-03-21
-- File: 013-foreign-keys-between-track-artist-and-album.sql

 --     TRACK       ARTIST
         -- +-> id      +-> id
         -- |   name    |   name
         -- |   artist -+
         -- |
         -- |   ALBUM_TRACKS
         -- +-  track           (PK, FK)
         -- +-  album           (PK, FK)
         -- |
         -- |
         -- |   ALBUM
         -- +-> id
         --     name
         --     year
         --     label

-- PRAGMA sends database specific command
-- SQLite does not have foregign keys enabled by default
PRAGMA foreign_keys = ON;
-- CREATE TABLE
-- ---------------------------------------------------

DROP TABLE IF EXISTS artist;

CREATE TABLE artist
(
    id         INTEGER
    ,name    VARCHAR(100)
    , CONSTRAINT artist_pk_id
      PRIMARY KEY (id)
);

DROP TABLE IF EXISTS track;

CREATE TABLE track
(
   id          INTEGER
   , name     VARCHAR(100)
   , artist      INTEGER

   , CONSTRAINT track_id_pk
     PRIMARY KEY (id)

   , CONSTRAINT track_artist_fk
     FOREIGN KEY (artist)
     REFERENCES artist (id)
);
DROP TABLE IF EXISTS album;
CREATE TABLE album
(
    id         INTEGER
    ,name    VARCHAR(100)
    ,year   YEAR
    ,label    VARCHAR(100)
    , CONSTRAINT album_pk_id
      PRIMARY KEY (id)
);
DROP TABLE IF EXISTS album_tracks;
CREATE TABLE album_tracks
(
   track          INTEGER
   , album     INTEGER

   , CONSTRAINT albumtrack_track_pk
     PRIMARY KEY (track,album)
   , CONSTRAINT albumtrack_track_fk
     FOREIGN KEY (track)
     REFERENCES track (id)
   ,CONSTRAINT albumtrack_album_fk
     FOREIGN KEY (album)
     REFERENCES album (id)
);
-- ---------------------------------------------------
-- INSERT: artist
-- ---------------------------------------------------

INSERT INTO artist
    (id, name)
VALUES
    (10, 'ACCOUNTING')
;

INSERT INTO artist
    (id, name)
VALUES
    (20, 'RESEARCH')
;

INSERT INTO artist
    (id, name)
VALUES
    (30, 'SALES')
;

-- ---------------------------------------------------
-- INSERT: track
-- ---------------------------------------------------

INSERT INTO track
    (id, name,artist)
VALUES
    (100, 'Smith', 10)
;

INSERT INTO track
    (id, name,artist)
VALUES
    (200, 'Jane', 30)
;

INSERT INTO track
    (id, name,artist)
VALUES
    (300, 'Michael', 20)
;
-- INSERT: album
-- ---------------------------------------------------

INSERT INTO album
    (id, name,year,label)
VALUES
    (1000, 'Smith',1999, "HELLO")
;

INSERT INTO album
    (id, name,year,label)
VALUES
    (2000, 'Jane',2010,"WORLD")
;

INSERT INTO album
    (id, name,year,label)
VALUES
    (3000, 'Michael', 2009,"NAME")
;

-- INSERT: album_tracks
-- ---------------------------------------------------

INSERT INTO album_tracks
    (track,album)
VALUES
    (100,1000)
;

INSERT INTO album_tracks
    (track,album)
VALUES
    (100,2000)
;

INSERT INTO album_tracks
    (track,album)
VALUES
    (100,3000)
;
-- ---------------------------------------------------
-- VIOLATION: Primary key
-- ---------------------------------------------------

-- primary key already exists
-- Error: stepping, UNIQUE constraint failed: artist.id (19)
INSERT INTO artist
    (id, name)
VALUES
    (10, 'ACCOUNTING')
;
-- primary key already exists
-- Error: stepping, UNIQUE constraint failed: track.id (19)
INSERT INTO track
    (id, name,artist)
VALUES
    (200, 'Jane', 30)
;
-- primary key already exists
-- Error: stepping, UNIQUE constraint failed: album.id (19)
INSERT INTO album
    (id, name,year,label)
VALUES
    (2000, 'Jane',2010,"WORLD")
;

-- ---------------------------------------------------
-- VIOLATION: Foreign key
-- ---------------------------------------------------

-- No artist id 40 in the ARTIST table
-- Error: stepping, FOREIGN KEY constraint failed (19)
INSERT INTO track
    (id, name,artist)
VALUES
    (700, 'Davis', 40)
;
-- No album id 7000 in the ALBUM table
-- Error: stepping, FOREIGN KEY constraint failed (19)
INSERT INTO album_tracks
    (track,album)
VALUES
    (100,7000)
;
-- End of file
