require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 60

  attr_reader :planes_on_ground, :iata_code, :capacity

  def initialize(iata_code, capacity = DEFAULT_CAPACITY)
    @planes_on_ground = []
    @iata_code = iata_code
    @capacity = capacity
  end

  def land_plane(plane)
    fail 'Operation aborted: Weather is stormy' if stormy?
    fail 'Operation aborted: Airport is full' if full?
    fail "The plane is already at #{@iata_code}" if plane.location == @iata_code
    @planes_on_ground.push(plane.land(self).tail_number)
  end

  def takeoff_plane(plane, destination)
    fail 'Operation aborted: Weather is stormy' if stormy?
    fail "The plane is not at #{@iata_code}"
    @planes_on_ground.delete(plane.takeoff(self).tail_number)
  end

  private

  def stormy?
    rand(1..7) == 7
  end

  def full?
    planes_on_ground.length >= capacity
  end

end
