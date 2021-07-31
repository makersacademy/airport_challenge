class Plane

  def take_off(airport, weather)
    raise "Unsafe weather conditions" if !weather.safe

    @airborne = true
    airport.planes.delete(self)
  end

  def airborne?
    @airborne
  end

end
