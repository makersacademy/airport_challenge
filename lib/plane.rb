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

    raise 'plane already flying' if flying?

    @flying = true if airport.permission_to_takeoff(self)

    "plane took off from #{airport.name} safely"
    
  end

  private

  def flying?
    @flying
  end
end
