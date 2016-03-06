require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :airport_weather

  DEFAULTCAPACITY = 20

  def initialize(capacity=DEFAULTCAPACITY)
    @planes = []
    @capacity = capacity
    @airport_weather = Weather.new
  end

  def call_land(plane)
    fail 'Bad weather means plane can\'t land' if airport_weather.stormy?
    fail 'The airport is full' if full?
    plane.landed?
    @planes << plane
  end

  def takeoff
    plane_check = planes.pop
    fail 'Plane is currently airborn' if plane_check.landed == false
    plane_check
  end

  private

  def full?
    planes.length+1 > capacity
  end

end
