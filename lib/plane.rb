class Plane

  def initialize
  	@flying = true
  end

  def flying?
  	@flying
  end

  def land
  	@flying = false
  end

  def landed?
  	not flying?
  end

  def take_off
  end

end
