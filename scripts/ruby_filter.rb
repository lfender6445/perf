#!/usr/bin/env ruby -n
require 'json'
hash = JSON.parse($_)
metrics_data =  hash['metrics'].to_json

p "HERE IS YOUR FILTERED METRICS DATA "

p metrics_data

# TODO: store directly into influxdb
