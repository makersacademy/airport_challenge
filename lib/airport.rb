require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  attr_reader :weather, :capacity, :planes

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    raise 'Invalid capacity' if capacity <= 0
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    landing_checks(plane)
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    raise 'No planes to takeoff' if empty?
    raise 'Plane is not in the airport' unless in_airport?(plane)
    raise 'Cannot takeoff in stormy weather' if stormy?
    plane.takeoff
    @planes -= [plane]
  end

  def adjust_capacity(capacity)
    raise 'Invalid capacity' if invalid_capacity?(capacity)
    raise 'Planes already exceeed that capacity!' if excess_planes?(capacity)
    @capacity = capacity
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

  def empty?
    @planes.empty?
  end

  def invalid_capacity?(capacity)
    capacity <= 0
  end

  def excess_planes?(capacity)
    @planes.length > capacity
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  def invalid_plane?(plane)
    cases = [String, Integer, Airport, Weather]
    cases.include?(plane.class)
  end

  def landing_checks(plane)
    raise 'Invalid plane' if invalid_plane?(plane)
    raise 'Plane is already in the airport' if in_airport?(plane)
    raise 'Plane already landed elsewhere!' if plane.landed?
    raise 'Cannot land in stormy weather' if stormy?
    raise 'Airport full' if full?
  end
end
