require_relative "plane"

class Airport 
  
  attr_reader :hanger

  def initialize 
    @hanger = []
  end

  def land(plane)
  	 @hanger << plane if plane.land
  end

  def take_off(plane)
    return raise("No such plane in hanger") unless plane?(plane)
    @hanger.delete(plane) if plane.take_off
  end
   

  private
  def plane?(plane)
    @hanger.include?(plane) ? true : false
  end
   
end
