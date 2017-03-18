class Airport
  attr_accessor :landed
  def initialize
    @landed = []
  end

  def create_new_plane
    Plane.new
  end

  def land(plane)
    @landed << plane
  end
  def landed?(plane)
    if @landed.include? plane
      true
    else false
    end
  end
  def take_off(plane)
    @landed.delete(plane)
  end
end
