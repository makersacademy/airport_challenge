class Airport
  def initialize
    @capacity = 10
    @planes = 0
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def planes=(num)
    @planes = num
  end

  def capacity=(num_of_planes)
    @capacity = num_of_planes
  end

  def add_plane
    @planes += 1
  end

  def remove_plane
    @planes -= 1
  end

  def is_full?
    @planes == @capacity ? true : false
  end

end