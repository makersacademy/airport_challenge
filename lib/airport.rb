require_relative 'plane'
require_relative 'weather'
require_relative 'traffic_control'

class Airport

  include Weather
  include TrafficControl

  DEFAULT_CAPACITY = 10

  attr_reader :landed_planes
  attr_reader :capacity

  def initialize
    @landed_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def ready_plane_for_take_off plane
    #TrafficControl.take_off_during_storm if !flying_possible?
    landed_planes.delete_if { |plane| plane.take_off } if flying_possible?
  end

  def ready_plane_for_landing plane
    #TrafficControl.landing_during_storm if !flying_possible?
    #TrafficControl.landing_when_airport_is_full if airport_full?
    landed_planes << plane.land if flying_possible?
  end

  private

  def airport_full?
    landed_planes.count == capacity
  end

  def flying_possible?
    report == :sunny
  end
  
end