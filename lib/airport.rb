require "./plane.rb"
require "./weather.rb"

class Airport
  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 12

  def initialize(capacity = 12, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(planes)
    allow_landing_permission? planes
    planes.landing # change flying? value to false
    @hangar.push(planes)
  end

  def takeoff(planes)
    allow_takeoff_permission? planes
    planes.takeoff
    @hangar.delete(planes)
  end

  private

  def hangar_full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def allow_landing_permission?(planes)
    # raise 'We accept only planes at this airport!' if planes.class != Plane
    # raise 'Before landing you have to start your engine first' if planes.flying?
    # raise 'The landing is delayed due to stormy weather' if weather.stormy?
    raise 'Our hangar is full, please land somewhere else.' if hangar_full?
  end

  def allow_takeoff_permission?(planes)
    # raise 'We allow only planes to takeoff at this airport!' if planes.class != Plane
    # raise 'You are already the air' if planes.flying?
    # raise 'Takeoff is delayed due to stormy weather' if weather.stormy?
    raise 'There are no planes in our hangar' if !hangar_full?
  end
end

