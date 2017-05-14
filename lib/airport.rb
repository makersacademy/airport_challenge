require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 40

  attr_reader :capacity, :planes_on_ground, :iata_code

  def initialize(iata_code, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_on_ground = []
    @iata_code = iata_code
    @weather = Weather.new
  end

  def land_plane(plane)
    raise 'Operation aborted: Weather is stormy' if stormy?
    raise 'Operation aborted: Airport is full' if full?
    raise 'The plane is already at #{@iata_code}' if plane.location == @iata_code
    @planes_on_ground << plane.land(self)
  end

  def takeoff_plane(plane, destination)
    raise 'Operation aborted: Weather is stormy' if stormy?
    raise 'The plane is not at #{@iata_code}' if plane.location != @iata_code
    @planes_on_ground.delete(plane.takeoff(destination))
  end

  def stormy?
    @weather.stormy?
  end

  def full?
    planes_on_ground.length >= capacity
  end

end
