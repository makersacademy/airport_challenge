#!/usr/bin/env ruby

require './lib/airport'

# The ATC (air traffic control) class checks to see if there might 
# be problems with air traffic movements. These are typically weather
# or capacity problems. ATC is a singleton class.
class ATC

  # Check capacity, because we are inserting an aircraft.
  def self.clear_docking(airport)
    capacity_check(airport)
  end

  # Check capacity, because we are inserting an aircraft and
  # check weather, as an aircraft is flying in our airspace.
  def self.clear_landing(airport)
    capacity_check(airport) && weather_check(airport)
  end

  # Check weather, as an aircraft is flying in our airspace.
  def self.clear_take_off(airport)
    weather_check(airport)
  end

  private_class_method

  # Raise error if airport weather is stormy.
  def self.weather_check(airport)
    raise AirportError, "stormy weather" if airport.stormy?
    true
  end

  # Raise error if airport is at capacity.
  def self.capacity_check(airport)
    raise AirportError, "airport full" if airport.full?
    true
  end
end
