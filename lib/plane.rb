class Plane


  def initialize  
    @airbourne = true
  end

  def airbourne?
    @airbourne
  end

  def landed?
    @landed
  end

  def land
    @airbourne = false
    @landed = true
  end

  def take_off
    @airbourne = true 
    @landed = false
  end

end
