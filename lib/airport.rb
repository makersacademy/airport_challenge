require_relative 'weather'

class Airport

  attr_accessor :planes, :message1, :message2

  include WEATHER

  def initialize
    @planes = []
    @message1 = "Warning: this plane is already in the airport."
    @message2 = "That plane is not here"
  end

  def land(arrival)
    fail message1 if planes.include? arrival

    planes.push(arrival)
  end

  def take_off(departure)
    fail message2 unless planes.include? departure

    planes.delete(departure)
  end

end
