class Plane
  attr_accessor :status
  def initialize
    @status = 'flying'
  end
  def landing
    true
  end
  def land
    @status='landed'
  end # if plane.landed called then status is told to change to landedirb

end
