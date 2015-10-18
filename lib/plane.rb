class Plane

   attr_reader :landed, :flying

  def land
    @landed = true
  end

  def landed?
    @landed
  end

  def take_off
    @flying = true
  end

  def taken_off?
    @flying
  end
end
