require_relative 'plane.rb'
class Airport
  def initialize
      @hanger = []
  end
  
  def land(airplane)
      airplane.the_airplane_has_landed_or_taken_off
      @hanger << airplane
  end
  
  def take_off
      @hanger.shift
  end
  
end