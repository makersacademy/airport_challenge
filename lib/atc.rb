#!/usr/bin/env ruby

require './lib/operation'

class ATC
  def self.clear(aeroplane)
    Operation.new(aeroplane)
  end
end
