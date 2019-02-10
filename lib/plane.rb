# This is the plane class

class Plane
 
  attr_writer :airbourne


  def initialize 
    @airbourne = false
  end

  def land
    p "Message to land received"
  end

  def takeoff
    @airbourne = true
    p "Message to takeoff received"
  end

  def airbourne
    @airbourne 
  end

end
