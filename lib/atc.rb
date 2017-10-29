#!/usr/bin/env ruby

require './lib/operation'
require './lib/airport'

class ATC
  def self.clear(airport)
    raise ArgumentError unless airport.is_a? Airport
    Operation.new(airport)
  end
end
