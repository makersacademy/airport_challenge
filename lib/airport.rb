require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :planes_in_hangar

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def takeoff(plane)
    fail "Planes cannot take off due to bad weather" if weather.stormy?
    @planes_in_hangar.delete(plane)
  end

  def land(plane)
    fail "Planes cannot land due to bad weather" if weather.stormy?
    fail "Planes cannot land due to airport hangar full" if full?
    @planes_in_hangar << plane
    plane
  end

  private

  attr_reader :weather

  def full?
    @planes_in_hangar.count >= @capacity
  end

end
