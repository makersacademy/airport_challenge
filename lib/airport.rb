require './lib/airplane.rb'
require './lib/weather.rb'

class Airport

 # attr_accessor :weather, :capacity, :hangar

  def initialize(weather = Weather.new.status, capacity = 5)
    @weather = weather
    @capacity = capacity
    @hangar = []
  end

  def land(*airplane)
    raise 'The weather is stormy' if @weather.status == :stormy

    raise 'The airport is full' unless @hangar.length < @capacity

    raise 'The airplane has already landed' if @hangar.include?(airplane[0])

    airplane.each {|plane| @hangar << plane}
    @hangar
  end

  def take_off(airplane)
    raise 'The weather is stormy' if @weather.status == :stormy

    raise 'The airplane is not in the airport' unless @hangar.include?(airplane)

    airplane = @hangar.delete(airplane)
    "The airplane #{airplane} has taken off"
  end

end
