require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/airplane.rb'
require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/weather.rb'

class Airport

  attr_accessor :weather, :capacity, :hangar

  def initialize
    @weather = :sunny
    @capacity = 5
    @hangar = []
  end

  def land(airplane, weather = Weather.new.status)
    weather
    raise 'The weather is stormy' if weather == :stormy

    raise 'The airport is full' unless @hangar.length < @capacity

    raise 'The airplane has already landed' if @hangar.include?(airplane)

    @hangar << airplane
  end

  def take_off(airplane, weather = Weather.new.status)
    weather
    raise 'The weather is stormy' if weather == :stormy

    raise 'The airplane is not in the airport' unless @hangar.include?(airplane)

    airplane = @hangar.delete(airplane)
    "The airplane #{airplane} has taken off"
  end

end
