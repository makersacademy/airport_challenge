class Plane

  attr_reader :landed
  def initialize
    @landed = false
  end

  def land
    @landed = true
  end

  def takeoff
    @landed = false
  end







  # attr_reader :clearance
  #
  # def initialize
  #   @clearance = false
  # end
  #
  # def request_clearance(airport)
  #   if @clearance
  #     @clearance = false
  #   else
  #     @clearance = airport.clearance?
  #   end
  # end
  #
  # def land(airport)
  #   airport.plane_lands(self)
  # end


end
