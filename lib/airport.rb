require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10
  
  attr_reader :capacity

  def initialize
    @landed_planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def ready_plane_for_take_off plane
    landed_planes.select {|plane| plane == plane.take_off}
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

  attr_reader :landed_planes
  
end
