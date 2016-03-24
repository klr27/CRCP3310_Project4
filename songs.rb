# Kali Ruppert
# Project 4
# Working with RDBMS

require "sqlite3"

DB_FILE_NAME = "songs.sqlite3.db"
db = SQLite3::Database.new(DB_FILE_NAME)

SONGS_NAME = "songs.name AS Song"
GENRES_NAME = "genres.name AS Genre"
ARTISTS_NAME = "artists.name AS Artist"
ALBUMS_NAME = "albums.name AS Album"

SQL_SELECT_SONGS = "SELECT #{SONGS_NAME}, #{GENRES_NAME}, #{ARTISTS_NAME}, #{ALBUMS_NAME} FROM WHERE songs.genre_id = genres.id AND songs.album_id - albums.id AND albums.artist_id = artists.id;"


def welcome()
	puts "Welcome to the music database!"
	puts "   1. Display all song information."
	puts "   2. Add a new genre."
	puts "   3. Add a new album."
	puts "   4. Add a new artist."
	puts "   5. Add a new song."
	puts "Enter a choice:"
end

welcome()



#SQL_SELECT_GENRES = "SELECT name FROM genres;"



#db.execute(SQL_SELECT_GENRES) do |row|
#	puts row
#end

#db.close
