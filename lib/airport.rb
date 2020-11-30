require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail 'Airport full' if full?
    @planes << plane
    'Plane has landed'
  end

  def take_off(plane)
    @planes.delete(plane)
    'Plane has left airport'
  end

  def full?
    @planes.count >= capacity
  end

  def stormy?
    @weather.stormy?
  end

  def stormy_take_off(plane)
    raise 'Operation aborted: Weather is stormy' if stormy?
    @planes.delete(plane.take_off)
  end

  # def takeoff_plane(plane, destination)
  # raise 'Operation aborted: Weather is stormy'                     if stormy?
  # raise 'Operation aborted: The plane is not at #{@iata_code}'     if plane.location != @iata_code
  # @planes_on_ground.delete(plane.takeoff(destination))
end
