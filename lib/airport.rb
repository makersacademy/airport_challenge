require_relative 'plane.rb'

class Airport

  AIRPORT_CAPACITY = 231 # number of gates at London Heathrow - LHR

  attr_reader :gates, :gates_size
  attr_accessor :stormy_weather

  def initialize(gates_size = AIRPORT_CAPACITY, stormy_weather=false)
    @gates = []
    @stormy_weather = stormy_weather
    @gates_size = gates_size
  end

  # def weather(boolean)
  #   @stormy_weather = boolean
  # end

  def stormy_weather
    rand(1..10) > 7
    # if rand(1..10) > 1
    #   @stormy = true # setting weather to stormy
    #   "The weather is stormy"
    # else
    #   @stormy = false
    #   "The weather is clear"
    # end
  end

  def land(plane)
    raise "The weather is stormy, plane cannot land" if stormy_weather == true
    raise "No gates available - cannot land plane" if @gates.count >= @gates_size
    raise "Plane is already landed" if @gates.include?(plane)
    @gates << plane
    "The plane has landed"
  end

  def take_off(plane)
    raise "The weather is stormy, plane cannot takeoff" if stormy_weather == true
    raise "There are no planes currently at the airport - No departures" if @gates.count == 0
    # raise "Plane is already flying" unless @gates.include?(plane) && defined?(@planes).nil?
    raise "Plane is not in this airport, thus cannot takeoff" unless @gates.include?(plane)

    @gates.delete(plane)
    "The plane has departed"
  end

end
