

class Plane
  attr_accessor :landed #allows reading and writing of @landed

  def initialize
    @landed = true
  end

  def landed?
    @landed
  end
end
