require './lib/plane'
require './lib/weather'


class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 25

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def return_planes
    return @planes
  end

  def land(plane)
    raise "Airport capacity is reached" if full?
    raise "Stormy conditions - Plane cannot land" if @weather.get_conditions == "stormy"
    @planes << plane
  end

  def take_off(plane)
    raise "Stormy conditions - Plane cannot take off" if @weather.get_conditions == "stormy"
    raise "No plane available to take off" if empty?
    raise "Plane not available to take off" if !@planes.include?(plane)
    @planes.delete(plane) if @planes.include?(plane)
  end


  private

  def empty?
   return true if @planes.empty?
  end

  def full?
    return true if @planes.count >= capacity
  end
end