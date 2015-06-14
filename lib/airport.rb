require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10
  
  attr_reader :capacity

  def initialize
    @landed_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def ready_plane_for_take_off plane
    landed_planes.delete_if { |plane| plane.take_off } if flying_possible?
  end

  def ready_plane_for_landing plane
    landed_planes << plane.land
  end

  def traffic_control
    fail 'Plane can not land, the airport is full.' if airport_full?
    'Plane is egibible to land'
  end

  def airport_full?
    landed_planes.count >= capacity
  end

  def flying_possible?
    report == :sunny
  end

  attr_reader :landed_planes
  
end
