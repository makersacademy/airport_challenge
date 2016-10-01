require_relative 'plane.rb'

class Airport

  AIRPORT_CAPACITY = 20

  attr_reader :terminal, :terminal_size
  attr_accessor :stormy

  def initialize(terminal_size = AIRPORT_CAPACITY, stormy=false)
    @terminal = []
    @stormy = stormy
    @terminal_size = terminal_size
  end

  def weather(boolean)
    @stormy = boolean
  end

  def land(plane)
    raise "No terminals available" if @terminal.count >= @terminal_size
    @terminal << plane
    "The plane has landed"
  end

  def take_off(plane)
    raise "There are no planes currently at the airport - No departures" if @terminal.count == 0
    @terminal.pop
    "The plane has departed"
  end



end
