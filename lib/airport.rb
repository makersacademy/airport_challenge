require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/airplane.rb'
require '/Users/student/Desktop/Desktop/projects/Week1/Weekend_1/airport_challenge/lib/weather.rb'

class Airport
  attr_accessor :weather, :capacity, :hangar

  def initialize
    @weather = Weather.new.status
    @capacity = 5
    @hangar = []
  end

  def land(airplane)
    raise 'The weather is stormy' if @weather == :stormy

    raise 'The airport is full' unless @hangar.length < @capacity

    raise 'The airplane has already landed' if @hangar.include?(airplane)

    @hangar << airplane
  end

  def take_off(airplane)
    raise 'The weather is stormy' if @weather == :stormy

    raise 'There are no airplanes in the airport' if @hangar.empty?

    "The airplane #{airplane} has taken off"
  end

end
