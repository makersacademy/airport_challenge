require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :weather, :planes

  DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = Array.new
    @weather = weather
    @capacity = capacity
  end

def land(plane)
  raise 'airport is at full capacity' if full?
  raise "can't land due to bad weather" if @weather.stormy?
  @planes << plane
end

def takeoff(plane)
  raise "no planes in airport" if @planes.empty?
  raise "can't takeoff due to bad weather" if @weather.stormy?
  @planes.delete(plane)
  @planes
end

def in_airport?(plane)
  @planes.include? plane
end

def full?
    @planes.count >= @capacity
  end

end
