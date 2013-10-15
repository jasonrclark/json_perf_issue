#!/usr/bin/env ruby

require 'json'
require 'benchmark'

payload = JSON.load(File.open("./payload.json", "r"))

Benchmark.bm do |x|
  x.report do
    20.times do
      JSON.dump(payload)
    end
  end
end
