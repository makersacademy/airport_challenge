require_relative './weather'

class Airport

  DEFAULT_CAPACITY = 100

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def full?
    @planes.count >= @capacity
  end

  def land(plane)
    fail 'The airport is full' if full?
    fail 'It is too stormy to land' if @weather.forecast == :stormy
    fail 'The plane is already at the airport' if @planes.include?(plane)
    plane.land
    @planes << plane
    true
  end

  def take_off(plane)
    fail 'The plane is not at this airport' unless @planes.include?(plane)
    fail 'It is too stormy to take off' if @weather.forecast == :stormy
    plane.take_off
    return @planes.delete(plane)
  end

end
