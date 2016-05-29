class Plane

  attr_reader :on_ground
  attr_reader :location

  def initialize
    @on_ground = false
    @location = nil
  end

  def land(airport)
    airport_result = airport.accept_plane(self)
    if airport_result.is_a? String
      return "Unable to land. Message from airport: #{airport_result}"
    else
      @on_ground = true
      @location = airport
      return "Plane landed at #{airport}."      
    end
  end

  # def take_off

  # end

end