class Plane

  def initialize(status = 'on ground')
    @status = status
  end

  def land(weather, airport)
    raise "Cannot land in #{weather.status} weather" if weather.status == 'stormy'
    raise "Airport is at capacity" if airport.full?
    airport.receive << self
    @status = 'landed'
  end

  def take_off(weather, airport)
    raise "Cannot take off in #{weather.status} weather" if weather.status == 'stormy'
    airport.release(self)
    @status = 'in air'
  end

  def confirm_status
    @status
  end

end
