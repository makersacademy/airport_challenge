class Plane
  attr_reader :airborne
  
  def initialize
    # to do: build flying plane factory
    @airborne = true
  end

  def land
    raise 'Plane is not airborne' unless airborne
    @airborne = false
  end

  def takeoff
    raise 'Plane is already airborne' if airborne
    @airborne = true
  end
end
