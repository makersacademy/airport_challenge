class Airport
  attr_accessor :plane, :stormy_conditions

  def initialize(stormy_conditions = false)
    @plane = plane
    @stormy_conditions = stormy_conditions
  end

  def land(plane)
    fail "Weather stormy: unsafe to land." if @stormy_conditions == true
    @plane = plane unless full?
  end

  def take_off
    fail "Weather stormy: can't take off" if @stormy_conditions == true
    fail "No planes avaliable for take off." if @plane.nil?
    @plane = nil
  end

  def full?
    return false if @plane.nil?
    fail "Airport full."
  end

  private



end
