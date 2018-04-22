require "weather"

class Airport

  attr_accessor :planes, :DEFAULT_CAPACITY

  def initialize(capacity = 20)
    @planes = []
    @DEFAULT_CAPACITY = capacity
  end

  def land(plane, weather = Weather.new)
    raise "This airport is full" if @planes.length >= @DEFAULT_CAPACITY
    storm_error(weather)
    @planes.include?(plane) ? raise("This plane is already here") : @planes << plane
  end

  def take_off(plane, weather = Weather.new)
    storm_error(weather)
    @planes.include?(plane) ? @planes.delete(plane) : raise("This plane has already left")
  end

  def is_plane_present?(plane)
    @planes.include?(plane)
  end

  def storm_error(weather)
    raise "It is too stormy to fly" if weather.condition == "stormy"
  end

end
