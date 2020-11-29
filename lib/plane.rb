require_relative './airport.rb'

class Plane

  attr_reader :current_airport

  def initialize
    @current_airport = "flying"
  end

  def land(airport)
    fail "This airport is full!" if airport.full?
    fail "The weather is too stormy!" if airport.stormy?
    airport.hangar << self
    @current_airport = airport
    "Landed!"
  end

  def take_off
    fail "The weather is too stormy!" if @current_airport.stormy?
    @current_airport.hangar.delete(self)
    @current_airport = "flying"
    "Taken off!"
  end

end