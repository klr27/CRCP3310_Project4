# Kali Ruppert
# Project 4
# Working with RDBMS

require "sqlite3"

DB_FILE_NAME = "songs.sqlite3.db"
db = SQLite3::Database.new(DB_FILE_NAME)

SQL_SELECT_SONGS = "SELECT songs.name, genres.name, artists.name, albums.name FROM songs, genres, artists, albums WHERE songs.genre_id = genres.id AND songs.album_id - albums.id AND albums.artist_id = artists.id;"
SQL_SELECT_GENRES = "SELECT * FROM genres;"
SQL_SELECT_ARTISTS = "SELECT * FROM artists;"
SQL_SELECT_ALBUMS = "SELECT * FROM albums;"

SQL_INSERT_GENRE = "INSERT INTO genres (name) VALUES (?)"
SQL_INSERT_ARTIST = "INSERT INTO artists (name) VALUES (?)"
SQL_INSERT_ALBUM = "INSERT INTO albums (name, artist_id) VALUES (?, ?)"
SQL_INSERT_SONG = "INSERT INTO songs (name, genre_id, album_id) VALUES (?, ?)"

def welcome()
	puts "\nWelcome to the music database!"
	puts "   1. Display all song information."
	puts "   2. Add a new genre."
	puts "   3. Add a new album."
	puts "   4. Add a new artist."
	puts "   5. Add a new song."
	puts "Enter a choice:"
end

welcome()
input = gets.chomp

case 
when input == "1"
	puts "\n" + "%-25s %-20s %0s %25s" % ["Song Name", "Genre", "Artist", "Album"]
	db.execute(SQL_SELECT_SONGS) do |song, genre, artist, album|
		puts "%-25s %-20s %0s %25s" % [song, genre, artist, album]
	end

when input == "2"
	puts "\nGenres in database:"
	db.execute(SQL_SELECT_GENRES) do |id, genre|
		puts "\s\s\s" + genre
	end
	puts "Enter a new genre name:"
	new_genre = gets.chomp
	db.execute(SQL_INSERT_GENRE, [new_genre])

when input == "3"
	puts "\nAlbums in database:"
	db.execute(SQL_SELECT_ALBUMS) do |id, album, artist|
		puts "\s\s\s" + album
	end
	puts "Enter a new album name:"
	new_album = gets.chomp
	puts "\nArtists in database:"
	puts "\s\s\sID\tArtist Name"
	db.execute(SQL_SELECT_ARTISTS) do |id, artist|
		puts "\s\s\s#{id}\t" + artist
	end
	puts "Select an artist ID number"
	artist_id = gets.chomp.to_i
	db.execute(SQL_INSERT_ALBUM, [new_album, artist_id])

when input == "4"
	puts "\nArtists in database:"
	db.execute(SQL_SELECT_ARTISTS) do |id, artist|
		puts "\s\s\s" + artist
	end
	puts "Enter a new artist name:"
	new_artist = gets.chomp
	db.execute(SQL_INSERT_ARTIST, [new_artist])

when input == "5"
	puts "Add new song"
end

db.close



