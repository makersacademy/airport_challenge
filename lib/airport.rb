class Airport
  def initialize
    @capacity = 10
    @planes = []
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def capacity=(num_of_planes)
    @capacity = num_of_planes
  end
end