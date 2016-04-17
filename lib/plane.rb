class Plane

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