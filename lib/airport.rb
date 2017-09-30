class Airport

  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def full?
    true
  end

  def accept_plane
    raise("Airport full -> can't accept planes!") if full?
  end

  def plane_take_off
  end

end
