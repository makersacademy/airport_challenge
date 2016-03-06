require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :plane
attr_accessor :storage

def initialize
  @storage = []
end

def land(plane)
  plane.landed?
  @storage << plane
end

def take_off(plane)
  raise "no take off due to storm" if Weather.new.stormy? == "stormy"
  plane.taken_off
  @storage.pop
end

end
