require './lib/plane.rb'
DEFAULT_CAPACITY = 25

class Airport
  attr_reader :hanger, :capacity

  def initialize(constant = DEFAULT_CAPACITY)
    raise "Please input a positive number" if not_valid_input(constant)

    @capacity = constant
    @hanger = []
  end

  def land_plane(plane)
    raise "The weather is too stormy to land" if weather == 1
    raise "Airport hanger is full" if full?
    
    plane.land
    @hanger.push(plane)
  end

  def plane_take_off(plane)
    raise "The weather is too stormy to take off" if weather == 1
    raise "Plane is not in hanger" if @hanger.none? { |x| x.id == plane.id }
    
    plane.take_off
    @hanger.delete(plane)
  end

  private

  def not_valid_input(constant)
    constant.negative? || !constant.is_a?(Integer)
  end

  def full?
    hanger.count == DEFAULT_CAPACITY
  end

  def weather
    # rare is considered 1 in 1000 - 1 in 10000
    rand(1..500_0)
  end

end
