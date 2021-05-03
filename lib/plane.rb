class Plane
  attr_reader :state
  
  def initialize
    takeoff
  end

  def land
    @state = :landed
  end

  def takeoff
    @state = :flying
  end
end