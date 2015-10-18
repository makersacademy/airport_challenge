require_relative "airport"

class Plane
  attr_reader :airport

  def initialize()
    @flying = true
    @airport = nil
  end

  def land( airport)
    raise "Not flying" if !flying?
    airport.request_landing(self)
    @flying = false
    @airport = airport
  end

  def take_off(airport)
    raise "Already flying" if flying?
    raise "Plane cannot take off from requested airport" if (@airport != airport)
    airport.request_take_off(self)
    @flying = true
    @airport = nil
  end

  private
  def flying?
    @flying
  end
end