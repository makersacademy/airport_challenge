require_relative './plane'
require_relative './weather'

class Airport

  attr_accessor :planes, :capacity, :storm

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @storm = weather.stormy?
  end

  def land_plane(plane)
    check_if_plane_is_already_in_airport(plane)
    if storm
      raise "Weather is too stormy to land" 
    elsif full?
      raise "Airport is full"
    else @planes << plane
    end
  end
  
  def take_off(plane)
    if storm
      raise "Weather is too stormy to take off"
    elsif empty?
      raise "There are no planes at this airport"
    else @planes.pop
      "#{plane} has left the airport"
    end
  end

  private
  def full?
    @planes.count == @capacity 
  end

  def empty?
    @planes.count == 0
  end

  def check_if_plane_is_already_in_airport(plane)
    if planes.include?(plane)
      raise "This plane has already landed in this airport"
    end
  end

end
