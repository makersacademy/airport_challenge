class Plane

  def initialize
    @landed = false
  end

  def landed?
    @landed
  end

  def instruct_to_land
    @landed = true
  end

end
