require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/airplane.rb'
require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/weather.rb'

class Airport
  attr_accessor :weather, :capacity

  def initialize 
    @weather = Weather.new.status
    @capacity = []
  end

  def land(airplane)
    raise 'The weather is stormy' if @weather == :stormy

    raise 'The airport is full' unless @capacity.empty?

    airplane
  end

  def take_off(airplane)
    raise 'The weather is stormy' if @weather == :stormy

    "The airplane #{airplane} has taken off"
  end

end
