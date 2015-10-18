class Plane

  attr_reader :landed, :flying

  def land
    @landed = true
    @flying = false
  end

  def landed?
    @landed
  end

  def take_off
    fail 'You are already flying' if @flying == true
    @flying = true
    @landed = false
  end

  def taken_off?
    @flying
  end

  def landed?
    @landed
  end
end
