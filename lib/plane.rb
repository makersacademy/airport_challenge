require_relative 'airport'

class Plane

  attr_accessor :landed

  def initialize
    @landed = false
  end

  def confirm_take_off(airport)
    if airport.planes.include? self
      return false
    else
      return true
    end
  end

end
