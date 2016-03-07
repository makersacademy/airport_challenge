class Plane

  # attr_reader: flying

  def initialize(flying=true)
    @flying = flying
  end

  def land  # setter method)
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def is_flying? # getter method
    @flying
  end

end
