class Airport

  attr_reader :capacity

  CAPACITY = 5

  def initialize(capacity = CAPACITY)
    @capacity = capacity
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def landed_planes

  end

end
