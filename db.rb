require "sqlite3"

class Db

    def initialize
        @db = SQLite3::Database.new "test.db"
    end

    def save

    end

end


 class Student < Db
    
    def initialize(id, name, email, blog, wow_factor)
        @id = id
        @name = name
        @email = email
        @blog = blog
        @wow_factor = wow_factor
    end

    def is_cool?
        @wow_factor > 5
    end

    def save
        db.execute "insert into students (name, email, blog, wow_factor) values ('Owen', 'wow@wow.com', 'some blog content', 7)"
    end
    
 end


# Open a database
db = SQLite3::Database.new "test.db"
db.results_as_hash = true

db.execute "create table if not exists students (id INTEGER not null primary key AUTOINCREMENT, name varchar(50), email varchar(50),  blog varchar(50), wow_factor INTEGER not null)"

db.execute "insert into students (name, email, blog, wow_factor) values ('Owen', 'wow@wow.com', 'some blog content', 7)"

students = db.query 'select * from students where id = ?', 1
p students

# student_objects = []
#   db.execute( "select * from students" ) do |row|
#     student_objects.push Student.new(row[0], row[1], row[2], row[3], row[4])
#   end
# p student_objects


