require_relative 'weather'
require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Plane has already landed" if plane.landed?
    fail "Cannot land as airport is full" if full?
    fail "Plane cannot land due to storm" if stormy?

    plane.land
    @planes << plane
  end

  def take_off(plane)
    fail "Plane has already taken off" unless plane.landed?
    fail "Plane is not at this airport" unless has?(plane)
    fail "Plane cannot take off due to storm" if stormy?

    plane.take_off
    @planes.delete(plane)
  end

  def has?(plane)
    @planes.include? plane
  end

  private
    def stormy?
      @weather.stormy?
    end

    def full?
      @planes.length >= @capacity
    end

end
