require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def generate_new_plane
    fail 'Unable to generate a new plane cause airport is full' if full?
    planes << new_plane = Plane.new
    new_plane
  end

  def land plane
    fail 'Unable to land due to stormy weather' if weather.stormy?
    fail 'Unable to land cause airport is full' if full?
    plane.land
    planes << plane
  end

  def take_off plane
    msg = "Unable to instruct plane to take off cause is not in the airport"
    fail msg unless has? plane
    fail 'Unable to take off due to stormy weather' if weather.stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def full?
    planes.size >= capacity
  end

  def has? plane
    planes.include? plane
  end

end
