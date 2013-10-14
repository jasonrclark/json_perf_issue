#!/usr/bin/env ruby

require 'json'
require 'benchmark'

payload = JSON.load(File.open("./payload.json", "r"))

Benchmark.bm do |x|
  x.report { JSON.dump(payload) }
  x.report { JSON.dump(payload) }
  x.report { JSON.dump(payload) }
end
