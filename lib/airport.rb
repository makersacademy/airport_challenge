require_relative "plane"

class Airport 
  
  attr_reader :hanger

  def initialize 
    @hanger = []
  end

  def land(plane, weather)
  	 @hanger << plane if can_land?(plane)
  end

  def take_off(plane, weather)
    plane?(plane)
    weather?(weather)
    @hanger.delete(plane) if plane.take_off
  end
   

  private
  def plane?(plane)
    raise("No such plane in hanger") unless @hanger.include?(plane)
  end

  def can_land?(plane)
  	true if  plane.land && plane.flying == false
  end

  def weather?(weather)
    raise("Weather too bad") if weather.forecast == "stormy" 
  end
  

 
end
