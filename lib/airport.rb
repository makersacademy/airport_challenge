
class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off(plane)
    plane
  end

  # def plane
  #   @plane
  # end


end
