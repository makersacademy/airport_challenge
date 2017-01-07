class Plane
  attr_reader :airport
  def initialize
    @landed = false
    @airport = nil
  end

  def land airport
    raise "can't land if already landed" if landed?
    @landed = true
    @airport = airport
  end

  def take_off
    raise "plane already in the air!" if !landed?
    @landed = false
  end

  def stormy?
  end
  def landed?
    @landed
  end
end
