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
    airport_result = airport.accept_plane(self)
    if airport_result.is_a? String
      return "Unable to land. Message from airport: #{airport_result}"
    else
      @on_ground = true
      @location = airport
      return "Plane landed at #{airport}."      
    end
  end

  # #take_off instructs the plane to take off, changing its
  # instance variables to reflect that it is now in the air.
  def take_off
    return "Plane is already in the air!" if !@on_ground
    @on_ground = false
    @location = nil
    "Plane has taken off."
  end

end