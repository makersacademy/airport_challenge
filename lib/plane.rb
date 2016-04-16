require 'airport'

class Plane
  attr_reader :landed, :airport

  def initialize(airport)
    @airport = airport
  end

  def land(airport)
    @airport = airport
    fail "Can't land in in stormy weather" if airport.weather == "stormy"
    @landed = true
  end

  def take_off
    fail "Can't take off in stormy weather" if airport.weather == "stormy"
    @landed = false
    true
  end

  def landed?
    landed
  end

  private
  attr_writer :landed, :airport

end
