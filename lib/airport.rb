require_relative 'plane'

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
  plane.take_off
  @storage.pop
end

end
