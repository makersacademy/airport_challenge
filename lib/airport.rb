require_relative 'weather'

class Airport < Weather

  attr_accessor :planes, :messages, :capacity

  def initialize
    @planes = []
    @messages = ["Warning: this plane is already in the airport.", "That plane is not here", "Inclement weather", "Airport full"]
    @weather = bad_weather?
    @capacity = 5
  end

  def land(arrival)
    fail messages[3] if planes.count >= capacity
    fail messages[2] if @weather
    fail messages[0] if planes.include? arrival

    planes.push(arrival)
  end

  def take_off(departure)
    fail messages[2] if @weather
    fail messages[1] unless planes.include? departure

    planes.delete(departure)
  end

end
