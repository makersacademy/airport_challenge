class Airport
  def initialize(capacity)
    @capacity = capacity
    @number_of_planes = 0
  end

  def land(plane)
    raise "Cannot land, airport is full!!" if @number_of_planes >= @capacity
    @number_of_planes += 1
  end

  def take_off(plane)
  end
end