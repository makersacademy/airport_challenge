#!/usr/bin/env ruby

require './lib/air_exceptions'

class Operation
  attr_reader :aeroplane
  OPERATIONS = [:dock, :land, :take_off]

  def initialize(aeroplane)
    @aeroplane = aeroplane
  end

  def able_to?(operation)
    OPERATIONS.include? operation
  end

  def to(task, options = {})
    raise ArgumentError, "cannot do #{task}" if !able_to?(task)
    airport = options[:at] || @aeroplane.airport
    self.send(task, airport)
  end

  def dock(airport)
    raise AirportError, "airport full" if airport.full?
  end

  def land(airport)
    raise AirportError, "airport full" if airport.full?
    raise AirportError, "stormy weather" if airport.stormy?
  end

  def take_off(airport)
    raise AirportError, "stormy weather" if airport.stormy?
  end
end
