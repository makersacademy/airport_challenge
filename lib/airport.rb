class Airport

  attr_reader :capacity, :stored_planes

  CAPACITY = 5

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @stored_planes = Array.new
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

end
