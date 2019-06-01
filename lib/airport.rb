require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/airplane.rb'
require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/weather.rb'

class Airport
  attr_accessor :weather
  
  def initialize 
    @weather = Weather.new.status
  end

  def land(airplane)
    airplane
  end

  def take_off(airplane)
    raise 'The weather is stormy' if @weather == :stormy

    "The airplane #{airplane} has taken off"
  end

end
