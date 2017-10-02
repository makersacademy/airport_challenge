

require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 10

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full!" if full?
    fail "Cannot land the same plane" if @planes.include?(plane)
    # plane.landed
    @planes << plane
    plane.landed
  end

  def take_off(plane)
    fail "no planes available for take-off!" if empty?
    fail "Cannot take-off during a storm" if stormy?
    @planes.pop.taken_off
  end

  private    #only want the aiport needs to know the full or empty methods, so we make them private. so there is no conflict

  attr_reader :planes

  def full?
    planes.count >= capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    Weather.new.stormy?
  end


  # def same_plane?
  #   @planes.include?(@plane)
  # end

end


# def take_off(plane)
#   raise "Plane not in airport" unless at_airport?(plane)
#   raise "Cannot take-off during a storm" if stormy?
#   plane.fly
#   puts "Plane has departed" unless at_airport? @planes.delete(plane)
# end




# airport.capacity - you are calling the capacity method on airport
# aiport.capacity = 100 means you have set the capaicty to eq 100
