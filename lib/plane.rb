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

  def instruct_to_take_off
    @landed = false
  end

end
