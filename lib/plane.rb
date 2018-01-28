class Plane
  def landed
    @landed = true
  end

  def take_off
    @landed = false
    "#{self} has taken off"
  end
  
  def landed?
    @landed
  end
end
