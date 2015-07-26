class Plane
  def initialize
  	@flying = true
  end
  # The plane is created flying

  def land
  	@flying = false
  end
  # A way to land the plane or a way to stop the plane flying

  def take_off
  	@flying = true
  end
  # A way for the plane to take off, "start flying"

  def flying?
  	@flying
  end
  # An identifier for if tte plane is flying

  def landed?
  	!@flying
  end
  # An identifier for if the plane has landed or is on the ground
end
