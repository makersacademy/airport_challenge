require_relative 'plane'
require_relative 'weather'
class Airport
<<<<<<< HEAD
 attr_accessor :capacity

 DEFAULT_CAPACITY = 10

 def initialize (capacity = DEFAULT_CAPACITY)
   @planes = []
   @capacity = capacity
 end

 def land(plane)
    raise "The airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "No planes at the airport" if empty?
    @planes.pop
  end

  private

  attr_reader :capacity, :planes

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
=======
   def land(plane)
     raise "Airport is full" if Plane.new
    # raise "Landing not allowed due to stormy weather" if is_stormy
    Plane.new
  end

  def take_off(plane)
    # raise "Planes won't take off due to stormy weather" if is_stormy
    @plane
  end

private
  def is_stormy
  Weather.new.stormy?
>>>>>>> master
  end


end
