# Kali Ruppert
# Project 4
# Working with RDBMS

require "sqlite3"

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


#DB_FILE_NAME = "songs.sqlite3.db"
#SQL_SELECT_GENRES = "SELECT name FROM genres;"

#db = SQLite3::Database.new(DB_FILE_NAME)

#db.execute(SQL_SELECT_GENRES) do |row|
#	puts row
#end

#db.close
