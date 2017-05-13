class Plane

  def initialize
    @taken_off = false
    @landed = true
  end

  def suitable_for_flying?
    true
  end

  def landed?
    @landed
  end

  def taken_off?
    @taken_off
  end

end
