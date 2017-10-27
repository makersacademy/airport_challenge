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
    manage_landing(airport)
  end

  def manage_landing(airport)
    airport.clear_landing
    do_landing(airport)
    airport.register_arrival(self)
  end

  def do_landing(airport)
    @airport = airport
  end

  def take_off
    is_flying_check
    manage_take_off(@airport)
  end
  
  def manage_take_off(airport)
    airport.clear_take_off
    do_take_off
    airport.register_departure(self)
  end

  def do_take_off
    @airport = nil
  end
end
