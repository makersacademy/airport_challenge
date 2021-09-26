class Airport
  def initialize 
    @landed = []
  end

  def land(plane)
    @landed << plane
  end

  def take_off
    @landed.pop
  end
    
end