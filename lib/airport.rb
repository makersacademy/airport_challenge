require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes_in_hangar = []
    @capacity = capacity
  end

  def takeoff_plane(plane)
    # takeoff plane object supplied as arg
    # unless weather.stormy?
    # confirm plane no longer in airport
  end

  def land_plane(plane)
    # takeoff plane object supplied as arg
    # unless weather.stormy?
  end

  private

  def full?
    # return true if planes in hangar >= capacity
  end

end
