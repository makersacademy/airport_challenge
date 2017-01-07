class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def land_plane
    raise "The plane is already on the ground!" if landed?
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    raise "The plane is already in the air!" if departed?
    @landed = false
  end

  def departed?
    !@landed
  end

end
