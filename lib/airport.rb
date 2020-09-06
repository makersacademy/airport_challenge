require 'weather'
require 'plane'

class Airport

  include Weather

  attr_reader :DEFAULT_CAPACITY, :planes
  DEFAULT_CAPACITY = 20

  AIRPORT_FULL_ERROR = 'Airport is at capacity'
  STORMY_ERROR = 'Weather is stormy and too unsafe'
  PLANE_NOT_HERE = 'Plane is not at this airport'

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def create_plane
    raise AIRPORT_FULL_ERROR if full?

    arrive(Plane.new)
  end

  def clear_landing(plane)
    raise AIRPORT_FULL_ERROR if full?
    raise STORMY_ERROR if stormy?

    plane.land
    arrive(plane)
  end

  def clear_takeoff(plane)
    raise PLANE_NOT_HERE unless has_plane?(plane)
    raise STORMY_ERROR if stormy?

    plane.takeoff
    depart(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  private

  def arrive(plane)
    @planes << plane
  end

  def depart(plane)
    @planes.delete(plane)
    plane
  end

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    self.weather == 'stormy'
  end
end
