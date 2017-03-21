# Plane status changes between flying and landed.
class Plane
  attr_accessor :status
  def initialize
    @status = "Flying"
  end

  def landed
    @status = "Landed"
  end

  def flying
    @status = "Flying"
  end
end
