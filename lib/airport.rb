require './lib/plane'

class Airport

  attr_reader :plane
  #this allows us to store our plane variables as @plane

  # def plane
  #   @plane
  # end
  #
  # def initialize
  #   @planes = []
  # end
  #
  # def land_at_airport(plane)
  #   @planes << @plane
  # end
  #
  # def take_off(plane)
  #   @planes.pop
  # end

  def land_at_airport(plane)
    @plane = plane
  end
  #this is an additional functionality, allowing
  #landed planes to be remembered

  def take_off(plane)
    @plane = plane
  end

end
