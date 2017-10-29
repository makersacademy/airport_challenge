#!/usr/bin/env ruby

require './lib/air_exceptions'

class Operation
  attr_reader :airport
  OPERATIONS = [:dock, :land, :take_off]

  def initialize(airport)
    @airport = airport
  end

  def able_to?(operation)
    OPERATIONS.include? operation
  end

  def to(task)
    raise ArgumentError, "cannot do #{task}" unless able_to?(task)
    send(task)
  end

  def weather_check
    raise AirportError, "stormy weather" if @airport.stormy?
    true
  end

  def capacity_check
    raise AirportError, "airport full" if @airport.full?
    true
  end

  def dock
    capacity_check
  end

  def land
    capacity_check && weather_check
  end

  def take_off
    weather_check
  end
end
