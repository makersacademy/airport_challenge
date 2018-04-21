class Airport

  attr_reader :docked_planes

  def initialize
    @docked_planes = []
  end

  def land(plane)
    docked_planes.push(plane)
  end

  def take_off(plane)
      fail 'Plane unavailable' unless docked_planes.include? plane
  end

end
