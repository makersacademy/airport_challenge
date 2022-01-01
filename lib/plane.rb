class Plane
  attr_accessor :docked

  def initialize(location = false)
    @docked = location
  end

  def dock
    @docked = true 
  end 

  def undock 
    @docked = false
  end

  def docked?
    @docked
  end 

end
