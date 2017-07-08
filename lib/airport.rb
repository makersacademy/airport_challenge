class Airport

  DEFAULT_CAPACITY = 10

  attr_reader :name, :capacity, :runway

  def initialize(capacity = DEFAULT_CAPACITY)
    @name = ""
    @capacity = capacity
    @runway = []
  end

  def land(plane)
    fail 'Aircraft is already on the ground' if plane.landed
    fail 'Weather is stormy - arrival delayed' if stormy?
    fail "Flight -  #@name is at capacity. Maintain holding!" if full?
    runway << plane
    plane.report_landed
    "Tower - this is #{plane.name}. We have touchdown at #@name"
  end

  def take_off(plane)
    fail "Aircraft is not present at this location" unless runway.include?(plane)
    fail 'Weather is stormy - departure delayed' if stormy?
    plane.report_airborne
    "Tower - #{plane.name} is now airborne, leaving #@name"
  end

  def stormy?
    rand(10) <= 2
  end

  def full?
    runway.count >= capacity
  end

end
