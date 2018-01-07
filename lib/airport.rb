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
    return raise("No such plane in hanger") unless plane?(plane)
    return raise("Weather too bad") if weather.forecast == "stormy"
    @hanger.delete(plane) if plane.take_off
  end
   

  private
  def plane?(plane)
    @hanger.include?(plane) ? true : false
  end

 
end
