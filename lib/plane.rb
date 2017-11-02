class Plane
  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def landed
    raise "Plane has already landed" if landed?
    @landed = true
  end

  def air
    raise "Plane is already in the air" unless landed? 
    @landed = false
  end


end
