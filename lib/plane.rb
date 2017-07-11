class Plane

  def initialize
    @landed = false
  end

  def land
    raise "This plane has already landed!" if landed?
    @landed = true
  end

  def take_off
    raise "This plane is already flying!" if flying?
    @landed = false
  end

  def landed?
    @landed
  end

  def flying?
    !@landed
  end

end
