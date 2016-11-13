require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes
  attr_reader :capacity
  attr_reader :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def stormy?
    true
  end

  def land_plane(plane)
    raise "Airport is full" if airport_full?
    planes << plane
  end

  def in_airport?(plane)
    planes.include?(plane)
  end

  def takeoff(plane)
    raise "Plane cannot takeoff because it is not in the airport" unless in_airport?(plane)
    planes.delete(plane)
    plane
  end

  private

  def airport_full?
    planes.count >= capacity
  end



end
