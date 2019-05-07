# This is the plane class

class Plane
 
  attr_writer :airbourne

  def initialize 
    @airbourne = false
  end

 # Note that condiion can be any condition that prevents landing
  def land(bad_condition)
    if bad_condition
      p "Landing aborted"
      @airbourne = true
      false
    else
      p "Message to land received"
      @airbourne = false
      true
    end
  end

  def takeoff(bad_condition)
    if bad_condition
      @airbourne = false
      p "Take off aborted"
    else
      @airbourne = true
      p "Message to takeoff received"
    end
    @airbourne
  end

end
