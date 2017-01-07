class Plane
  attr_reader :airport, :landed
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

  def take_off location = airport
    raise "plane already in the air!" if !landed?
    raise "can't take off in storm!" if stormy?
    raise "plane not at that airport!" if location != airport
    @landed = false
    @airport = nil
  end

  def landed?
    landed
  end

  def stormy? location = airport
    raise "plane location unknown!" if location == nil
    location.stormy?
  end
end
