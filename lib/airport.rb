require_relative 'weather'

class Airport
  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land_plane(plane)
    if @weather.stormy?
      fail "Too stormy for landing"
    elsif full?
      fail "Airport full" if full?
    else
      plane.landed?
      @planes << plane
      "The plane has landed"
    end
  end

  def take_off(plane)
    fail "Too stormy for take-off" if @weather.stormy?
    plane.flying
    @planes.delete(plane)
  end

  private

  def full?
    @capacity <= @planes.count
  end

end
