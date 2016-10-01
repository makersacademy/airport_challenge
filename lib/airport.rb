require_relative 'plane.rb'

class Airport

  AIRPORT_CAPACITY = 231 # number of gates at London Heathrow - LHR

  attr_reader :gates, :gates_size
  attr_accessor :stormy

  def initialize(gates_size = AIRPORT_CAPACITY, stormy=false)
    @gates = []
    @stormy = stormy
    @gates_size = gates_size
  end

  def weather(boolean)
    @stormy = boolean
  end

  def land(plane)
    raise "No gates available" if @gates.count >= @gates_size
    @gates << plane
    "The plane has landed"
  end

  def take_off(plane)
    raise "There are no planes currently at the airport - No departures" if @gates.count == 0
    @gates.pop
    "The plane has departed"
  end



end
