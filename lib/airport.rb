class Airport

  DEFAULT_CAPACITY = 5

  attr_reader :name, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @name = ""
    @capacity = capacity
  end

  def land(plane)
    fail 'Weather is stormy - arrival delayed' if stormy?
    fail "Flight -  #@name is at capacity. Maintain holding!" if full?
    "Tower - this is #{plane.name}. We have touchdown at #@name"
  end

  def take_off(plane)
    fail 'Weather is stormy - departure delayed' if stormy?
    "Tower - #{plane.name} is now airborne, leaving #@name"
  end

  def stormy?
    rand(10) <= 2
  end

  def full?
    capacity == 5
  end

end
