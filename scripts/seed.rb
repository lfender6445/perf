#!/usr/bin/env ruby
require 'json'

user = 'root'
pass = 'root'

db      = 'dev_test'

payload = {
  foo: 'bar',
  ts: "#{Time.now}"
}.to_json

99.times do
  `curl -X POST -d '#{payload}' 'http://localhost:8086/db/#{db}/series?u=#{user}&p=#{pass}' `
end

# investigate series vs tables
