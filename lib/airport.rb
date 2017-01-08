require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Airport is full." if full?
    (weather == "sunny") ? true : false
    @planes << plane
    plane.landed
    plane
  end


  def take_off
    raise "Plane cannot take off due to stormy weather." if weather == "stormy"
    raise "No planes in airport." if empty?
    plane = @planes.pop
    plane.departed
  end



private

  def weather
    Weather.new.current_weather
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end



end
