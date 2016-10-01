require './lib/plane'

class Airport
    
    attr_accessor :capacity, :planes, :planes_landed
  
  DEFAULT_CAPACITY = 5
    
  def initialize (capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    fail "Can't land, the Airport is full." if full?
    fail "Can't land, the plane isnt flying" if !plane.flying
    #fail "Unable to land due to stormy weather" if weather == "stormy"
    plane.flying = false
    @planes_landed << plane
    puts "#{plane} has landed"
    plane
  end

  def launch(plane)
    fail "Can't take off. Plane is flying." if plane.flying?
    plane.flying = true
    @planes_landed.pop
    puts "#{plane} has taken off"
  end

  def full?
    @planes_landed.count >= DEFAULT_CAPACITY
  end

  #set 6 for roughly once a week 30 for a month etc
  # def weather
  #   rand(6) == 0 ? "stormy" : "sunny"
  # end
end