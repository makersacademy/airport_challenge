require_relative = 'plane'
require_relative = 'weather'

class Airport
  attr_reader :plane, :capacity, :weatherInst
  DEFAULT_CAPACITY = 10

  def initialize (capacity = DEFAULT_CAPACITY)
    @plane = []
    @capacity = capacity
    @weatherInst = Weather.new
  end

  def land (plane)
    fail "Airport is full" if @plane.length > @capacity 
    fail "Plane already laneded" if @plane.index(plane) != nil
    fail "Stormy weather conditions, can't land" if @weatherInst.stormy?
    @plane.push(plane)
  end

  def take_off (plane)
    fail "Plane not in airport, so can't take off" if @plane.index(plane) == nil
    fail "Stormy weather conditions, can't take off" if @weatherInst.stormy?
    puts "#{plane} has taken off"
    index = @plane.index(plane)
    @plane.delete_at(index)
  end

end
