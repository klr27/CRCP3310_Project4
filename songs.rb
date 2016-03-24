require "sqlite3"

DB_FILE_NAME = "songs.sqlite3.db"
SQL_SELECT_GENRES = "SELECT name FROM genres;"

db = SQLite3::Database.new(DB_FILE_NAME)

db.execute(SQL_SELECT_GENRES) do |row|
	puts row
end

db.close
