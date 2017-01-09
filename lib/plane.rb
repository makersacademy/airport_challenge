class Plane
  attr_reader :landed, :taken_off
  attr_accessor :landing, :taking_off

  def initialize(airport=nil)
    @landing = false
    @landed = true
    @taking_off = false
    @taken_off = false
    airport.fleet(self) if airport
  end

  def take_off(airport)
    raise 'Not cleared for takeoff' if !clear_for_take_off? && !taken_off?
    @landed = false
    airport.fleet(self)
    @taking_off = false
    @taken_off = true
  end

  def land(airport)
    raise 'Not cleared for landing' if !clear_to_land? && !landed?
    @taken_off = false
    airport.fleet(self)
    @landing = false
    @landed = true
  end

  private

  def clear_for_take_off?
    @taking_off
  end

  def taken_off?
    @taken_off
  end

  def clear_to_land?
    @landing
  end

  def landed?
    @landed
  end
end
