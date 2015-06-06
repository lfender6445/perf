require 'json'

@user = 'root'
@pass = 'root'
@db   = 'dev_test'

@payload = [{
  name:    'foo',
  columns: ['val'],
  points:  [
    ["#{rand(100)}"]
  ]
}].to_json

def drop_db
  `curl -X DELETE 'http://localhost:8086/db/#{@db}?u=#{@user}&p=#{@pass}' &>/dev/null`
end

def create_db
  `curl -X POST 'http://localhost:8086/db?u=#{@user}&p=#{@pass}' \
      -d '{"name": "#{@db}"}' &>/dev/null`
end

def seed
 60.times do
    # series is foo, has columns val
    `curl -X POST -d '#{@payload}' 'http://localhost:8086/db/#{@db}/series?u=#{@user}&p=#{@pass}' &>/dev/null`
    sleep 0.5
  end
end

drop_db
create_db
seed
