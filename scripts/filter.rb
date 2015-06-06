require 'json'
require 'influxdb'

hash = JSON.parse($_)
data  =  hash['metrics']

db = 'perf_development'
influxdb = InfluxDB::Client.new db


(0..10).to_a.map do |index|
  p index
  sleep 1
  influxdb.write_point("phantomas_#{index}", data)
end


# TODO: store directly into influxdb
