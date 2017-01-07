class Plane
  attr_reader :airport
  def initialize
    @landed = false
    @airport = nil
  end

  def land airport
    raise "can't land if already landed" if landed?
    raise "can't land in storm" if stormy? airport
    @landed = true
    @airport = airport
  end

  def take_off airport = @airport
    raise "plane already in the air!" if !landed?
    raise "can't take off in storm!" if stormy?
    raise "plane not at that airport!" if airport != @airport
    @landed = false
    @airport = nil
  end

  def landed?
    @landed
  end

  def stormy? airport = @airport
    raise "plane location unknown!" if airport == nil
    airport.stormy?
  end
end
