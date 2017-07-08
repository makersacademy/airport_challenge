class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :name, :capacity, :runway

  def initialize(capacity = DEFAULT_CAPACITY)
    @name = ""
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    fail 'Weather is stormy - arrival delayed' if stormy?
    fail "Flight -  #@name is at capacity. Maintain holding!" if full?
    runway << plane
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
    runway.count <= capacity
  end

end
