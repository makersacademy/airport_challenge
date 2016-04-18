class Plane

  def initialize
    @flying = true
  end

  def confirm_landing
    @landed = true
  end

  def flying? 
    true
  end

  def landed?
    @landed
  end
  
end