#!/usr/bin/env ruby

class Aeroplane
  attr_reader :airport

  def initialize(airport = nil)
    @airport = airport
  end

  def flying?
    !@airport
  end

  def is_flying_check
    raise AeroplaneError, "is already flying" if flying?
  end

  def is_grounded_check
    raise AeroplaneError, "already landed" if !flying?
  end

  def land(airport)
    is_grounded_check
    airport.clear_landing
    @airport = airport
    airport.register_arrival(self)
  end

  def take_off
    is_flying_check
    airport = @airport
    @airport.clear_take_off
    @airport = nil
    airport.register_departure(self)
  end

end
