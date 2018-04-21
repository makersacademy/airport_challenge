class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane.land
    @hangar.push(plane)
  end

  def take_off(plane, isStormy = false)
    fail 'No planes in airport' if @hangar.length <= 0
    fail 'Plane not in airport' if !@hangar.include?(plane)
    fail 'Cannot take off in stormy weather' if isStormy
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    plane.take_off
    return plane
  end

  def confirmLeftAirport(plane)
    return !@hangar.include?(plane)
  end

end
