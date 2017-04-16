class Plane

  attr_reader :status

  def initialize(status = :on_ground)
    @status = status
  end

  def land(weather, airport)
    raise "Cannot land in stormy weather" if stormy(weather)
    raise "I have already landed" if status == :landed
    airport.receive(self)
    @status = :landed
  end

  def take_off(weather, airport)
    raise "Cannot take off in stormy weather" if stormy(weather)
    raise "I am already in the air" if flying?
    airport.release(self)
    @status = :in_air
  end

  def confirm_status
    status
  end

  def flying?
    confirm_status == :in_air
  end

  def stormy(weather)
    weather.status == :stormy
  end

end
