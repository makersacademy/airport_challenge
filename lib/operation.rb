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
    raise ArgumentError, "cannot do #{task}" if !able_to?(task)
    self.send(task)
  end

  def weather_check
    if @airport.stormy?
      raise AirportError, "stormy weather" 
    else
      true
    end
  end

  def capacity_check
    if @airport.full?
      raise AirportError, "airport full"
    else
      true
    end
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
