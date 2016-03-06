require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULTCAPACITY = 20

  def initialize(capacity=DEFAULTCAPACITY)
    @planes = []
    @capacity = capacity
  end

  def call_land(plane)
    fail 'Bad weather means plane can\'t land' if weather_check
    fail 'The airport is full' if full?
    plane.landed?
    @planes << plane
  end

  def takeoff
    fail 'No planes in airport' if airport_empty?
    plane_check = planes.pop
    fail 'Plane is currently airborn' if plane_check.landed == false
    plane_check.airborn?
    plane_check
  end



  private

  def full?
    planes.length+1 > capacity
  end

  def airport_empty?
    planes == []
  end

  def weather_check
    Weather.new.stormy?
  end

end
