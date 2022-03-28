class Airport
  def initialize(airport_capacity)
    @airport_capacity = airport_capacity
    @number_of_planes = 0
  end

  def land_plane(plane)
    raise 'No space at airport for plane to land' if @number_of_planes == @airport_capacity
    @number_of_planes += 1
  end

  def plane_take_off(plane)
  end
end
