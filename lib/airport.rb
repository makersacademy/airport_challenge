require_relative 'atc'
require_relative 'plane'

class Airport
 include ATC
   attr_accessor :airport, :population, :capacity

  #def initialize(airport_population: 1, airport_capacity: 0)
  def initialize(capacity, population)
    @population = population
    @capacity = capacity
    puts "To collate the data, please type in airport.full?"
  end

  def full?
    #puts "Please type in 'airport.full' to clarify the data."
    if @population.to_i > @capacity.to_i
      puts "Airport is over it's capacity."
      cancel_landing
    else
      x = @capacity - @population
      puts "Airport has an excess capacity of #{x} "
      confirm_weather
    end
  end

  def weather
    airport = Airport.new
    puts "To confirm weather, type in 'airport.confirm_weather'"
  end
end
