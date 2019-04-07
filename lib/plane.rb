require_relative 'airport'

class Plane

  def confirm_take_off(airport)
    if airport.planes.include? self
      return false
    else
      return true
    end
  end

end
