class Plane

  def land(airport, weather)
    raise "Airport is full" if airport == "full"

    raise "Too stormy for landing!" if weather == "stormy"

    airport.planes.push(self)
  end

  def take_off(airport, weather)
    raise "Too stormy for take off!" if weather == 'stormy'

    if airport != nil
      airport.planes.delete(self)
    else
    "Plane is taking off"
    end
  end
end
