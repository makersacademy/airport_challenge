require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 60

  attr_reader :planes_on_ground, :iata_code, :capacity

  def initialize(iata_code, capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes_on_ground = []
    @iata_code = iata_code
    @capacity = capacity
    @weather = weather
  end

  def land_plane(plane)
    fail 'Operation aborted: Weather is stormy' if stormy?
    fail 'Operation aborted: Airport is full' if full?
    fail "Operation aborted: The plane is already at #{@iata_code}" if plane.location == @iata_code
    fail 'Operation aborted: Plane is on ground' if plane.on_ground == true
    @planes_on_ground << plane.land(self)
  end

  def takeoff_plane(plane, destination)
    fail 'Operation aborted: Weather is stormy' if stormy?
    fail "Operation aborted: The plane is not at #{@iata_code}" if plane.location != @iata_code
    @planes_on_ground.delete(plane.takeoff(destination))
  end

  private
  attr_reader :weather

  def stormy?
    @weather.stormy?
  end

  def full?
    planes_on_ground.length >= capacity
  end

end
