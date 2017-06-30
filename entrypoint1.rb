	puts "krongkanddd"
require "pathname"
if 	system "id postgres"
	puts "user already exist"
else
	p system "useradd postgres"
end
	path=Pathname.new "/data"

if path.exist?
	puts "path data already exist"
else
	 require 'fileutils'
	FileUtils::mkdir_p '/data'
	puts "add path data"
end

file1 = File.open("/usr/password.txt","w"){ |file| 
file.write("aaaa")
}
	p system "chown -R postgres.postgres /data/"
if  Dir['/data/*'].empty?
	puts "folder is empty"
	system 'runuser postgres -c "initdb --pwfile=/usr/password.txt  -D /data/"'
	File.delete("/usr/password.txt")
	open('/data/postgresql.conf', 'a') { |f|
  	f.puts "listen_addresses = '*'"
	}
	open('/data/pg_hba.conf', 'a') { |f|
 	f.puts "host all all 0.0.0.0/0 md5"
	}
else
	puts "folder not empty"
end

exec ' runuser postgres -c "postgres -D /data/"'