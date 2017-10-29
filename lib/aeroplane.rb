#!/usr/bin/env ruby

require './lib/air_exceptions'

# The Aeroplane class Represents any aircraft. Starts flying or 
# docked at an airport. Knows if flying or not. Can land at airports 
# and take-off from them, in both cases working with the airport in 
# question.
class Aeroplane
  attr_reader :airport, :name

  # Looks for optional name and airport - both default to nil. Docks
  # if an airport is passed - using symbol :at, for readability.
  def initialize(options = {})
    @name = options[:name]
    @airport = options[:at]
    dock(@airport) unless @airport.nil?
  end

  # Is flying if airport is nil and vice versa. Returns boolean.
  def flying?
    !@airport
  end

  # Raise error if landed. Register landing with +airport+ then set
  # @airport to the destination airport.
  def land(airport)
    raise AeroplaneError, "already landed" unless flying?
    airport.process_landing(self)
    do_arrival(airport)
  end

  # Raise error if flying. Register take-off with @airport then
  # set @airport to nil.
  def take_off
    raise AeroplaneError, "already flying" if flying?
    @airport.process_take_off(self)
    do_take_off
  end

  # String containing class name, name attribute if given and
  # location, which is the airport or airborne.
  def to_s
    "Aeroplane (#{@name || "unnamed"})"
  end

  private

  # Set airport to given value.
  def do_arrival(airport)
    @airport = airport
  end

  # Set airport to nil.
  def do_take_off
    @airport = nil
  end

  # Register docking with +airport+ and set @airport to the 
  # destination airport.
  def dock(airport)
    airport.process_docking(self)
  end
end
