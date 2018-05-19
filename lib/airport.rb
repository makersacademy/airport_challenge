require_relative './plane.rb'

class Airport

  attr_accessor :planes, :capacity

  def initialize(capacity = 30)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane can't land in stormy weather" if stormy?
    fail "Cannot land plane, airport is full" if full?
    @planes << plane
    "Your plane has been successfully stored"
  end

  def take_off
    fail "No planes available" if @planes.length.zero?
    fail "Plane can't take off in stormy weather" if stormy?
    @planes[-1]
    @planes.pop
  end

  def check_plane(plane) 
    @planes.include?(plane) ? true : false
  end

  def stormy? 
    weather_generator >= 75
  end

  def weather_generator
    rand(100)
  end

  def full?
    @planes.length >= @capacity
  end

end
