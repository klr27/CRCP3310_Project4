# Kali Ruppert
# Project 4
# Working with RDBMS

require "sqlite3"

DB_FILE_NAME = "songs.sqlite3.db"
db = SQLite3::Database.new(DB_FILE_NAME)

#SONGS_NAME = "songs.name AS Song"
#GENRES_NAME = "genres.name AS Genre"
#ARTISTS_NAME = "artists.name AS Artist"
#ALBUMS_NAME = "albums.name AS Album"

SQL_SELECT_SONGS = "SELECT songs.name, genres.name, artists.name, albums.name FROM songs, genres, artists, albums WHERE songs.genre_id = genres.id AND songs.album_id - albums.id AND albums.artist_id = artists.id;"
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ARTISTS = "SELECT name FROM artists;"
SQL_SELECT_ALBUMS = "SELECT name FROM albums;"

SQL_INSERT_GENRE = "INSERT INTO genres (name) VALUES (?)"
SQL_INSERT_ARTIST = "INSERT INTO artists (name) VALUES (?)"

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
	db.execute(SQL_SELECT_GENRES) do |genre|
		puts "    #{genre}"
	end
	puts "Enter a new genre name:"
	new_genre = gets.chomp
	db.execute(SQL_INSERT_GENRE, [new_genre])
when input == "3"
	puts "Add new album"
when input == "4"
	puts "\nArtists in database:"
	db.execute(SQL_SELECT_ARTISTS) do |artist|
		puts "    #{artist}"
	end
	puts "Enter a new artist name:"
	new_artist = gets.chomp
	db.execute(SQL_INSERT_ARTIST, [new_artist])
when input == "5"
	puts "Add new song"
end

db.close



