class Plane
  def initialize 
    # planes can either be flying or landed  
    @status = "flying" 
  end 
  
  def make_airborne
    @status = "flying"
  end 
  
  def make_landed
    @status = "landed"
  end 
end
