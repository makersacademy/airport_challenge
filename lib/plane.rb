<<<<<<< HEAD
class Plane
=======
>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
require_relative 'airport'

class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def land!
    @flying = false
  end
<<<<<<< HEAD
=======

>>>>>>> 596954af958e6a8e8a7a3a654ef5e5530983f27d
end
