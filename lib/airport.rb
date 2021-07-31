require './lib/plane.rb'
DEFAULT_CAPACITY = 25
class Airport
  attr_reader :hanger, :capacity

  def initialize(constant = DEFAULT_CAPACITY)
    @capacity = constant
    @hanger = []
  end

  def land_plane
    raise "The weather is too stormy to land" if weather == 1
    raise "Airport hanger is full" if full?
    
    @hanger.push(Plane.new)
  end

  def plane_take_off
    raise "The weather is too stormy to take off" if weather == 1
    
    @hanger.delete_at(-1)
  end

  private
  
  def full?
    hanger.count >= DEFAULT_CAPACITY
  end

  def weather
    rand(1..100_00)
  end

end
