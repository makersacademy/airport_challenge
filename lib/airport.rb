require_relative "plane"
require_relative "weather"

class Airport 
  
  attr_reader :hanger

  def initialize 
    @hanger = []
  end

  def land(plane, weather)
    can_land?(plane)
    weather?(weather)
    @hanger << plane 
  end

  def take_off(plane, weather)
    plane?(plane)
    weather?(weather)
    @hanger.delete(plane)
    "#{plane} has taken off"
  end
   

  private
  def plane?(plane)
    raise("No such plane in hanger") unless @hanger.include?(plane)
  end

  def weather?(weather)
    raise("Weather too bad") if weather.forecast == "stormy" 
  end

  def can_land?(plane)
    raise("Already Grounded") if @hanger.include?(plane)
  end

end
