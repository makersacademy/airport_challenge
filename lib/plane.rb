class Plane

  attr_reader :status

  def initialize(status = 'on ground')
    @status = status
  end

  def land(weather, airport)
    raise "Cannot land in #{weather.status} weather" if stormy(weather)
    raise "Airport is at capacity" if airport.full?
    airport.receive(self)
    @status = 'landed'
  end

  def take_off(weather, airport)
    raise "Cannot take off in #{weather.status} weather" if stormy(weather)
    raise "I am already in the air" if flying?
    raise "I am not in that airport" unless airport.planes.include?(self)
    airport.release(self)
    @status = 'in air'
  end

  def confirm_status
    @status
  end

  def flying?
    @status == 'in air' ? true : false
  end

  def stormy(weather)
    weather.status == 'stormy' ? true : false
  end
end
