require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY, planes = [], weather = Weather.new)
    @planes_in_hangar = planes
    @capacity = capacity
    @weather = weather
  end

  def takeoff(plane)
    fail "Planes cannot take off due to bad weather" if weather.stormy?
    fail "Plane is not in this airport" unless @planes_in_hangar.include? plane
    plane.takeoff
    fail "Plane did not take off" unless plane.flying?
    @planes_in_hangar.delete(plane)
  end

  def land(plane)
    fail "Planes cannot land due to bad weather" if weather.stormy?
    fail "Planes cannot land due to airport hangar full" if full?
    plane.land
    fail "Plane did not land" if plane.flying?
    @planes_in_hangar << plane
  end

  private

  attr_reader :weather, :planes_in_hangar

  def full?
    @planes_in_hangar.count >= @capacity
  end

end
