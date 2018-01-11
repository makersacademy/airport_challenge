require_relative "plane"
require_relative "weather"

class Airport 
   
  DEFAULT_CAPACITY = 20

  attr_reader :hanger, :capacity

  def initialize(capacity = DEFAULT_CAPACITY) 
    @hanger = []
    @capacity = capacity
  end

  def land(plane, weather = "good")
    can_land?(plane)
    weather?(weather)
    full?
    @hanger << plane 
  end

  def take_off(plane, weather = "good")
    plane?(plane)
    weather?(weather)
    @hanger.delete(plane)
    "#{plane} has taken off"
  end
   

  private
  def plane?(plane)
    raise("No such plane in hanger") unless @hanger.include?(plane)
  end

  def full? 
    raise("Airport full") if @hanger.length >= @capacity
  end

  def weather?(weather)
    raise("Weather too bad") if weather == "stormy" 
  end

  def can_land?(plane)
    raise("Already Grounded") if @hanger.include?(plane)
  end

end
