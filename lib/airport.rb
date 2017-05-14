require_relative 'plane'

class Weather
  def stormy?
    rand(10) < 3 ? true : false
  end
end

class Airport

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @weather = Weather.new
    @planes = []
  end

  def land(plane)
    raise "Unable to land plane - weather is stormy" if @weather.stormy?
    @planes << plane
  end

  def take_off(plane)
    raise "Plane is not at that airport" unless @planes.include?(plane)
    raise "Unable to take off - weather is stormy" if @weather.stormy?
    @planes.delete(plane)
  end

  def full?
    @planes.length == @capacity
  end

end
