require 'airport'

class Plane

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed
	  @flying = false
  end

end
