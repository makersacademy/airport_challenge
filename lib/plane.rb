class Plane

  attr_reader :on_ground
  attr_reader :location

  def initialize
    @on_ground = false
    @location = nil
  end

  # #land checks whether the airport will accept the plane
  # and if so, instructs the plane to land, changing the plane's
  # instance variables to show that it is now on the ground.
  def land(airport)
    return "Plane is already on the ground!" if @on_ground
    airport_result = airport.accept_landing(self)
    if airport_result.is_a?(String)
      return "Unable to land. Message from airport: #{airport_result}"
    else
      @on_ground = true
      @location = airport
      return "Plane landed at #{airport}."      
    end
  end

  # #take_off checks whether the airport will allow the take-off
  # and if so, instructs the plane to take off, changing the plane's
  # instance variables to reflect that it is now in the air.
  def take_off(airport)
    return "Plane is already in the air!" unless @on_ground
    airport_result = airport.allow_take_off(self)
    if airport_result.is_a?(String)
      return "Unable to take off. Message from airport: #{airport_result}"
    else
      @on_ground = false
      @location = nil
      "Plane took off from #{airport}."
    end
  end 

end