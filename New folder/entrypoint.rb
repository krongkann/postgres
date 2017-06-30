puts "HELLO WORLD"

if system "id postgres" 
	puts "have user"
else
	p system  "useradd postgres"
end

require "pathname"
path = Pathname.new "/data"

if path.exist?
	puts "have"
	puts "path create :" + path.exist?.to_s
else
    require 'fileutils'
	FileUtils::mkdir_p '/data'
end

file1 = File.open("/usr/password.txt","w"){ |file| 
file.write("aaaa")

}

p system "chown -R postgres.postgres /data/"
#run = 'runuser postgres -c "initdb -D /data/"'
run ='runuser postgres -c "initdb  --pwfile=/usr/password.txt  -D /data/"'
runp =' runuser postgres -c "postgres -D /data/"'
 
if Dir['/data/*'].empty?
	puts "folder is empry"
	system  run
	File.delete("/usr/password.txt")
	open('/data/postgresql.conf', 'a') { |f|
  f.puts "listen_addresses = '*'"
	}
	open('/data/pg_hba.conf', 'a') { |f|
  f.puts "host all all 0.0.0.0/0 md5"
	}
	#system user postgres
else
 	puts "not empty"
	
end
exec runp



 




puts "HELLO WORLD"

