class Plane

  attr_reader :grounded

  def initialize
    @grounded = true

  end

  def land_plane
    @grounded = true
  end

  def landed?
    @grounded
  end

end
