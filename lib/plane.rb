
class Plane

  def initialize 
  	@flying = true
  end

  def is_flying?
  	@flying
  end

  def land
  	@flying = false
  end

  def take_off
  	@flying = true
  end


end



