class Plane

attr_accessor :landing

  def initialize
    @flying = true
  @landed = false
  end

  def land
    @landed =true
    @flying =false
  end
  
  def take_off
    @flying = true
    @landed = false
  end

  def flying?
    @flying
  end

  def landed?
    @landed
  end

end
