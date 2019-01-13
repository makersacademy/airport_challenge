require_relative 'weather'

class Airport

  attr_accessor :planes, :message

  include WEATHER

  def initialize
    @planes = []
    @message = "Warning: this plane is already in the airport."
  end

  def land(arrival)
    fail message if planes.include? arrival
    
    planes.push(arrival)
  end

end
