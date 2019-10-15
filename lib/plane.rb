# /lib/plane

class Plane
  
  def initialize
    @flying = true
  end

  def arrive
    @flying = false
  end

  def depart
    @flying = true
  end

end
