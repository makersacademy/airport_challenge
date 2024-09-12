module PlaneMovements

  protected

  def lands
    @airborne = false
  end

  def takes_off
    @airborne = true
  end
end

# this module adds security level so only an Airport objects can call lands and takes_off of Plane objects
# problem with this is that Airport objects should probably not have these class methods
# leaving in here as an example incase doing this is appropriate for a future project

class Plane
  include PlaneMovements

  def initialize
    @airborne = true
  end

  def airborne?
    @airborne
  end

end
