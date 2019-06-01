class Airport
  def initialize
    @capacity = 10
  end

  def capacity
    @capacity
  end

  def capacity=(num_of_planes)
    @capacity = num_of_planes
  end
end