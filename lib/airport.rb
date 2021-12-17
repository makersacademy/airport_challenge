require_relative = 'plane'

class Airport
  attr_reader :plane, :capacity

  def initialize 
    @plane = []
    @capacity = 10
  end

  def land (plane)
    fail "Airport is full" if @plane.length > @capacity 
    @plane.push(plane)
  end

  def take_off(plane)
    puts "#{plane} has taken off"
    index = @plane.index(plane)
    @plane.delete_at(index)
  end

end
