require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end


  def land_plane(plane)
    raise "Airport is full" if airport_full?
    planes << plane
  end

  def takeoff(plane = planes.first)
    raise "Plane cannot takeoff because it is not in the airport" unless in_airport?(plane)
    raise "Plane cannot take off because there is a storm" if stormy?
    planes.delete(plane)
  end

  private

  def in_airport?(plane)
    planes.include?(plane)
  end

  def stormy?
    weather.stormy?
  end

  def airport_full?
    planes.count >= capacity
  end



end
