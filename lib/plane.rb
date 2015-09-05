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

  def has_taken_off
  	@flying = true
  end

end
