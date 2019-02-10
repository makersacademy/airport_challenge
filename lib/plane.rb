# This is the plane class

class Plane
 
  attr_writer :airbourne


  def initialize 
    @airbourne = false
  end

 # Note that condiion can be any condition that prevents landing
  def land(condition)
    if condition
      p "Landing aborted"
      @airbourne = true
      false
    else
      p "Message to land received"
      @airbourne = false
      true
    end
  end

  def takeoff(condition)
    if condition
      @airbourne = false
      p "Take off aborted"
    else
      @airbourne = true
      p "Message to takeoff received"
    end
    @airbourne
  end

  #def airbourne
  #  @airbourne 
  #end

end
