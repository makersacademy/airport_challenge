require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :capacity
  attr_accessor :hangar

  DEFAULT_CAPACITY = 12

  def initialize(capacity = 12)
    @hangar = []
    @capacity = capacity
  end

  def land(planes)
    allow_landing_permission? planes
    planes.landing
    @hangar.push(planes)
  end

  def takeoff(planes)
    allow_takeoff_permission? planes
    planes.offtake
    @hangar.delete(planes)
  end

  private

  def hangar_full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def hangar_empty?
    @hangar.count == 0
  end

  def weather
    Weather.new
  end

  def allow_landing_permission?(planes)
    raise 'We accept only planes at this airport!' unless planes.instance_of?(Plane)
    raise 'Before landing, you have to start your engine first' if !planes.flying?
    raise 'Our hangar is full, please land somewhere else' if hangar_full?
    # raise 'The landing is delayed due to stormy weather' if weather.stormy?
  end

  def allow_takeoff_permission?(planes)
    raise 'We allow only planes to takeoff at this airport!' unless planes.instance_of?(Plane)
    raise 'There are no planes in our hangar' if hangar_empty?
    # raise 'Takeoff is delayed due to stormy weather' if Weather.stormy?
  end
end

