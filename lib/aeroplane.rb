#!/usr/bin/env ruby

require './lib/air_exceptions'

class Aeroplane
  attr_reader :airport, :name

  def initialize(options = {})
    @name = options[:name]
    airport = options[:at]
    if airport.nil?
      @airport = nil
    else
      arrive(airport, true)
      @airport = airport
    end
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

  def land(airport)
    arrive(airport, false)
  end

  def take_off
    raise AeroplaneError, "is already flying" if flying?
    @airport.process_take_off(self)
    do_take_off
  end

  def to_s
    parts = []
    if @name.nil?
      parts.push "Aeroplane"
    else
      parts.push "Aeroplane '#{@name}'"
    end
    if flying?
      parts.push "airborne"
    else
      parts.push "at #{@airport.to_s}"
    end
    parts.join(", ")
  end
end
