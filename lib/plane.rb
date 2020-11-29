require_relative './airport.rb'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = "flying"
  end

  def flying?
    @current_airport == "flying"
  end

  def land(airport)
    fail "Already landed!" unless flying?
    fail "This airport is full!" if airport.full?
    fail "The weather is too stormy!" if airport.stormy?

    airport.hangar << self
    @current_airport = airport
    "Landed at #{@current_airport}!"
  end

  def take_off
    fail "Already flying!" if flying?
    fail "The weather is too stormy!" if @current_airport.stormy?

    @current_airport.hangar.delete(self)
    @current_airport = "flying"
    "Taken off!"
  end

end
