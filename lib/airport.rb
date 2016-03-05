class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def capacity
    @capacity
  end

  def land_plane(airplane)
    airplane.land
  end

end
