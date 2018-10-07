require 'weather.rb'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "Unable to land, stormy weather." if @weather.stormy?
    raise "Unable to land, airport full." if full?
    raise "Unable to land, plane is not flying." unless plane.flying?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise "Unable to take off, stormy weather." if @weather.stormy?
    raise "Unable to take off, plane is already flying." if plane.flying?
    raise "Unable to take off, plane not landed in this airport." unless @planes.include?(plane)
    plane.fly
    @planes.delete(plane)
  end

private
  def full?
    @capacity == @planes.count
  end

end
