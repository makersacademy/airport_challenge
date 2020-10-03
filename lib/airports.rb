class Airports
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @on_ground = []
  end

  def full?
    @on_ground.length >= 20 ? true : false
  end

end
