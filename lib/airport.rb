require_relative "plane"

class Airport 
  
  attr_reader :hanger

  def initialize 
    @hanger = []
  end

  def land(plane)
  	 @hanger << plane if plane.land && plane.flying == false
  end

  def take_off(plane, weather)
    plane?(plane)
    weather?(weather)
    @hanger.delete(plane) if plane.take_off
  end
   

  private
  def plane?(plane)
    @hanger.include?(plane) ? true : raise("No such plane in hanger") 
  end

  def weather?(weather)
    return raise("Weather too bad") if weather.forecast == "stormy"
  end
  

 
end
