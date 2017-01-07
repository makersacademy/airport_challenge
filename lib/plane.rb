class Plane

  attr_reader :airport, :landed

  def initialize
    @landed = false
    @airport = nil
  end

  def land airport
    fail "can't land if already landed" if landed?
    fail "can't land in storm" if stormy? airport
    @landed = true
    @airport = airport
  end

  def take_off location = airport
    fail "plane already in the air!" unless landed?
    fail "can't take off in storm!" if stormy?
    fail "plane not at that airport!" if location != airport
    @landed = false
    @airport = nil
  end

  def landed?
    landed
  end

  def stormy? location = airport
    fail "plane location unknown!" if location.nil?
    location.stormy?
  end
end
