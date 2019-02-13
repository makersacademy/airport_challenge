class Airport
  def initialize(capacity)
    @capacity = capacity
    @number_of_planes_landed = 0
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if @number_of_planes_landed >= @capacity
    @number_of_planes_landed += 1
  end

  def take_off(plane)
  end

end
