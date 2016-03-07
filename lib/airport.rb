require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :storage, :plane
attr_accessor :capacity

DEFAULT_CAPACITY = 10

def initialize
  @storage = []
  @capacity = DEFAULT_CAPACITY
end

def land(plane, weather=Weather.new)
  raise "no landing due to storm" if weather.stormy? == "stormy"
  raise "no space to land plane" if full?
  raise "plane has already landed" if plane.landed
  plane.land
  @storage << plane
end

def take_off(plane, weather=Weather.new)
  raise "no take off due to storm" if weather.stormy? == "stormy"
  raise "plane has already taken off" unless plane.landed
  plane.take_off
  @storage.delete(plane)
end

private

def full?
    storage.size == capacity
  end

end
