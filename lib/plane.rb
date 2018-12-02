require 'airport.rb'

class Plane

  def initialize
    @airbourne = true
  end

  def airbourne?
    @airbourne
  end

  def taking_off(airport)
    @airbourne = true if airport.takeoff(self)
  end

  def landing(airport)
    @airbourne = false if airport.land(self)
  end

end
