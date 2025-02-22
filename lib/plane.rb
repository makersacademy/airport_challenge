require_relative 'airport'

class Plane
  def land(airport)
    if airport.full?
      'full'
    else
      planes = airport.planes_landed
      airport.planes_landed = planes + 1
    end
  end

  def take_off(airport)
    'taken_off'
  end
end