class Plane
  def initialize
    @flying == true
  end

  def flying?
    @flying unless @landed
    return true
  end

  def landed?
    false unless @land
    return true
  end

  def can_land
  end

  def land
    @land == true
  end

  def take_off
    @take_off == true
  end
end
