#!/usr/bin/env ruby

class Aeroplane
  attr_reader :airport

  def initialize(airport = nil)
    @airport = airport
    manage_dock(airport) if !airport.nil?
  end

  def flying?
    !@airport
  end

  def land(airport)
    raise AeroplaneError, "already landed" if !flying?
    manage_landing(airport)
  end

  def manage_dock(airport)
    ATC.clear(self).to(:dock, :at => airport)
    do_landing(airport)
    airport.register_arrival(self)
  end

  def manage_landing(airport)
    ATC.clear(self).to(:land, :at => airport)
    do_landing(airport)
    airport.register_arrival(self)
  end

  def do_landing(airport)
    @airport = airport
  end

  def take_off
    raise AeroplaneError, "is already flying" if flying?
    manage_take_off(@airport)
  end
  
  def manage_take_off(airport)
    ATC.clear(self).to(:take_off)
    do_take_off
    airport.register_departure(self)
  end

  def do_take_off
    @airport = nil
  end
end
