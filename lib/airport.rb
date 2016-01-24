
require_relative 'weather'
require_relative 'plane'

class Airport

  include Weather

  DEFAULT_CAPACITY = 25

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    fail "The airport is full" if at_capacity?
    fail "The plane is already on the ground" unless plane.airborne
    fail "It's too stormy to land" if stormy?
    @planes << plane
    plane.landed
  end

  def send_plane(plane)
    fail "That plane isn't in this airport" unless @planes.include?(plane)
    fail "It's too stormy to take off" if stormy?
    @planes.delete(plane)
    plane.departed
  end

  def at_capacity?
    @planes.count >= capacity
  end

  def stormy?
    weather_conditions
  end

end
