#!/usr/bin/env ruby

require './lib/air_exceptions'

class Aeroplane
  attr_reader :airport, :name

  def initialize(airport = nil, name = "")
    @name = name
    arrive(airport, true) if !airport.nil?
    @airport = airport
  end

  def flying?
    !@airport
  end

  def do_arrival(airport)
    @airport = airport
  end

  def do_take_off
    @airport = nil
  end

  def arrive(airport, dock = false)
    raise AeroplaneError, "already landed" if !flying?
    if dock
      airport.process_docking(self)
    else
      airport.process_landing(self)
    end
    do_arrival(airport)
  end

  def take_off
    raise AeroplaneError, "is already flying" if flying?
    @airport.process_take_off(self)
    do_take_off
  end

  def to_s
    if flying?
      "Aircraft '#{@name}' (airborne)"
    else
      "Aircraft '#{@name}' (at #{airport.name})"
    end
  end
end
