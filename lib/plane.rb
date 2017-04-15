class Plane

  def initialize(status = 'on ground')
    @satus = status
  end

  def land(airport)
    airport.planes << self
    @status = 'landed'
  end

  def take_off(weather)
    raise "Cannot take off in #{weather.status} weather" if weather.status == 'stormy'
    @status = 'in air'
  end

  def confirm_status
    @status
  end

end
