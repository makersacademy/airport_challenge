class Plane
  def land
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @took_off = true
  end
  def taken_off?
    @took_off
  end
end
