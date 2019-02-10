# This is the plane class

class Plane
 
  attr_writer :airbourne


  def initialize 
    @airbourne = false
  end

  def land
    @airbourne = false
    p "Message to land received"
  end

  def takeoff(stormy = false)
    if !stormy
      @airbourne = true
      p "Message to takeoff received"
    else
      @airbourne = false
      p "Take off aborted due to stormy conditions"
    end
    @airbourne
  end

  #def airbourne
  #  @airbourne 
  #end

end
