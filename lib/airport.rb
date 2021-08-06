require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :capacity, :weather
  attr_accessor :hangar

  DEFAULT_CAPACITY = 12

  def initialize(capacity = 12, weather = Weather.stormy?, hangar = [])
    @hangar = hangar
    @capacity = capacity
    @weather = weather
  end

  def land(planes)
    # refuse_landing_when_stormy? planes
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
    @hangar.count.zero?
  end

  def blue_sky?
    @weather == :sunny
  end

  def allow_landing_permission?(planes)
    raise 'We accept only planes at this airport!' unless planes.instance_of?(Plane)
    raise 'Before landing, you have to start your engine first' unless planes.flying?
    raise 'Our hangar is full, please land somewhere else' if hangar_full?
    raise 'The landing is delayed due to stormy weather' unless blue_sky?
  end

  def allow_takeoff_permission?(planes)
    raise 'We allow only planes to takeoff at this airport!' unless planes.instance_of?(Plane)
    raise 'There are no planes in our hangar' if hangar_empty?
    raise 'Takeoff is delayed due to stormy weather' unless blue_sky?
  end
end
