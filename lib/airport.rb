require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 20

attr_accessor :capacity, :planes

  def initialize(capacity)
    @planes = []
    @capacity = capacity
  end

  def confirm_landing(plane)
    fail "Stormy-no landing" if stormy_weather?
    fail 'Airport full' if airport_full?
    planes << plane
  end

  def confirm_takeoff
    fail 'Stormy-cannot takeoff' if stormy_weather?
    fail 'No planes to takeoff' if airport_empty?
    planes.pop
  end

  def stormy_weather?
    weather = Weather.new
    weather.stormy?
  end

  def airport_full?
    planes.count >= capacity
  end

  def airport_empty?
    planes.empty?
  end

end
