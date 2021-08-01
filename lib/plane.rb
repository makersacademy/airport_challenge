class Plane
  
  def initialize
    @status = "flying"
  end
  
  def airborne?
    return true if @status == "flying"
    return false if @status == "landed"
  end
  
  def land
    @status = "landed"
  end
  
  def take_off
    @status = "flying"
  end
end
