class Airport
  attr_reader :weather, :planes
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize capacity = DEFAULT_CAPACITY
    @weather = %w(sunny stormy).shuffle[0]
    @planes = []
    @capacity = capacity
  end

  def land_plane plane
    fail 'Can not land, bad weather' if weather == 'stormy'
    fail 'Airport full' if planes.length == capacity
    plane.land
    planes.push(plane)
  end

  def initialize_take_off plane
    fail 'Can not take off, bad weather' if weather == 'stormy'
    plane.take_off
    planes.delete(plane)
  end
end
