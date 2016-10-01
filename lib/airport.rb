require './lib/plane'

class Airport
    
    attr_accessor :capacity, :planes, :planes_landed
  
  DEFAULT_CAPACITY = 5
    
  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    fail "Cant land, the Airport is full" if full?
    fail "Cant land, the plane isnt flying" if !plane.flying
    plane.flying = false
    @planes_landed << plane
    puts "#{plane} has landed"
    plane
  end

  def launch(plane)
    fail "Cant take off. Plane is flying." if plane.flying?
    plane.flying = true
    @planes_landed.pop
    puts "#{plane} has taken off"
  end

  def full?
    @planes_landed.count == DEFAULT_CAPACITY
  end

end
