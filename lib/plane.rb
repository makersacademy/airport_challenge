class Plane
  
  def initialize
    @status = "flying"
  end
  
  def airborne?
    return true if @status == "flying"
    return false if @status == "landed"
  end
  
  def landed
    @status = "landed"
  end
  
  def flying
    @status = "flying"
  end
end
