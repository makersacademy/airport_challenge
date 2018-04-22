class Airport
  attr_accessor :plane

  def initialize
    @plane = plane
  end

  def land
    fail "Plane already landed." if @plane == plane
    @plane = plane
  end

  def take_off
    fail "No planes avaliable for take off." if @plane.nil?
    @plane = nil
  end

end
