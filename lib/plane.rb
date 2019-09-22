require_relative 'airport'

class Plane
  attr_accessor :flying

  def initialize
    @flying = true
  end

  def land(airport)
    raise 'plane already grounded' unless flying?

    @flying = false if airport.permission_to_land(self)

    "plane landed safely at #{airport.name}"
  end

  def takeoff(airport)

  end

  private

  def flying?
    @flying
  end
end
