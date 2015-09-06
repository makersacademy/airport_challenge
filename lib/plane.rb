
class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def land
    fail 'Plane has already landed' unless @flying
    @flying = false
  end 

  def take_off
    fail 'Plane is already flying' if @flying  
    @flying = true
  end

  def flying?
    @flying
  end

  def landed?
    !@flying
  end

end


