require './lib/plane.rb'

class Airport
  
  attr_accessor :hanger, :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
   	@hanger = []
   	@capacity = capacity
  end

  def land(plane)
  	raise 'Plane already landed' if hanger.include?(plane)
  	raise 'Too stormy to land' if stormy?
   	@hanger.push(plane)
  end 

  def take_off(plane)
  	raise 'Too stormy to take off' if stormy?
    @hanger.delete(plane)
  end

  def stormy?
  	rand > 0.9
  end

end
