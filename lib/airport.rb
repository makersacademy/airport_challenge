require_relative = 'plane'

class Airport
  attr_reader :plane, :capacity

  def initialize
    @plane 
    @capacity = 10
  end

  def land (plane)
    fail "Airport is full" unless @plane == nil
    @plane = plane
  end

  def take_off(plane)
    puts "#{plane} has taken off"
    @plane = nil
  end

end
