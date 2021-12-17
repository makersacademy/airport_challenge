class Plane

  attr_reader :airbourne

  def initialize  
    @airbourne = true
  end

  def airbourne?
    airbourne
  end

  def land
    @airbourne = false
  end

  def take_off
    @airbourne = true
  end

end
