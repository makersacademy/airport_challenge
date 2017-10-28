#!/usr/bin/env ruby

require './lib/operation'

class ATC
  def self.clear(airport)
    Operation.new(airport)
  end
end
