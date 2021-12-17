require_relative = 'plane'

class Airport
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize (capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
  end

  def land (plane)
    fail "Airport is full" if @plane.length > @capacity 
    fail "Plane already laneded" if @plane.index(plane) != nil
    @plane.push(plane)
  end

  def take_off (plane)
    fail "Plane not in airport, so can't take off" if @plane.index(plane) == nil
    puts "#{plane} has taken off"
    index = @plane.index(plane)
    @plane.delete_at(index)
  end

end
