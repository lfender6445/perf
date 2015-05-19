# write
curl -X POST -d '[{"name":"foo","columns":["val"],"points":[[23]]}]' 'http://localhost:8086/db/mydb/series?u=root&p=root'

# read
curl -G 'http://localhost:8086/db/mydb/series?u=root&p=root&pretty=true' --data-urlencode "q=select * from foo"

-
select val from foo
