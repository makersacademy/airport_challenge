require_relative './plane'
require_relative './weather'

class Airport

  attr_accessor :planes, :capacity, :weather

  DEFAULT_CAPACITY = 2

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)

    if @weather.stormy?
      raise "Weather is too stormy to land" 
    elsif full?
      raise "Airport is full"
    elsif @planes << plane
    end

  end
  
  def take_off(plane)
    if @weather.stormy?
      raise "Weather is too stormy to take off"
    elsif empty?
      raise "There are no planes at this airport"
    elsif @planes.pop
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

end
