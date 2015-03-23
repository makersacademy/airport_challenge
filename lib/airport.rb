<<<<<<< HEAD
class Airport
=======
>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
require_relative 'plane'

class Airport
  def initialize
    @planes = [] #this is the container
  end

  def planes
    @planes
  end

  def land(plane)
    @planes << plane
  end
<<<<<<< HEAD
=======

>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
end
