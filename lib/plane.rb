
class Plane
  attr_accessor :status
  def initialize
    @status = "Flying"
  end

def status_land
  @status = "Landed"
end

def status_takeoff
  @status = "Flying"
end
end
