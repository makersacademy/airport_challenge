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
    #instruct plane to take off
    # takeoff plane object supplied as arg
    # unless weather.stormy?
    # confirm plane no longer in airport
  end

  def land(plane)
    # instruct plane to land
    # takeoff plane object supplied as arg
    # unless weather.stormy?
  end

  private

  def full?
    # return true if planes in hangar >= capacity
  end

end
