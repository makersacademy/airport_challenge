
class Plane

  def land(airport)
    return fail "cannot land airport full" unless (airport.planes.length < 
                                                   airport.capacity)
    airport.planes.push(self)
    return self
  end

  def take_off(airport)
    return fail "cannot take off bad weather" unless airport.weather != 'stormy'
    return fail "cannot take of airport empty" unless airport.planes.length >= 1
    airport.planes.delete(self) # remove self from array
  end
end
