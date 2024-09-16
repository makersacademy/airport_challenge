class Plane
  attr_accessor :dock_status
  def initialize
    @dock_status = false
  end

  def dock
    @dock_status = true
  end

  def undock
    @dock_status = false
  end

end
