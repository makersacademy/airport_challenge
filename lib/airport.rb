#!/usr/bin/env ruby

require './lib/atc'
require './lib/weather'
require './lib/air_exceptions'

# The Airport class stores Aeroplanes. It supports a limited number
# of aircraft - it knows its occupancy and when at capacity. It can
# process aircraft arrival and departures. These methods will first
# get permission for the movement using the ATC class and then add
# or remove the aircraft from the hangar.
class Airport
  attr_reader :name, :hangar, :capacity, :weather_generator
  DEFAULT_CAPACITY = 50

  # Create empty Array as @hangar. Set name to optional value or nil.
  # Set capacity to optional value or default value. Set weather 
  # generator to optional value or new Weather instance.
  def initialize(options = {})
    @hangar = []
    @name = options[:name]
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @weather_generator = options[:weather] || Weather.new 
  end

  # Get number of planes in hangar.
  def occupancy
    @hangar.count
  end

  # True if number of planes is equal to capacity. Compares using
  # greater-than-or-equal in the name of defensive programming.
  def full?
    occupancy >= @capacity
  end

  # True if airport weather is stormy. Gets weather from 
  # weather generator.
  def stormy?
    weather == :stormy
  end

  # True if +aeroplane+ is present in the hangar.
  def include?(aeroplane)
    @hangar.include? aeroplane
  end

  # Check landing with ATC class. Add aeroplane to hangar.
  def process_landing(aeroplane)
    ATC.clear(self).to(:land)
    register_arrival(aeroplane)
  end

  # Check docking with ATC class. Add aeroplane to hangar.
  def process_docking(aeroplane)
    ATC.clear(self).to(:dock)
    register_arrival(aeroplane)
  end

  # Check take-off with ATC class. Remove aeroplane from hangar.
  def process_take_off(aeroplane)
    ATC.clear(self).to(:take_off)
    register_departure(aeroplane)
  end

  # String containing class name, airport name (or unnamed) and
  # current occupancy versus capacity.
  def to_s
    "Airport (#{@name || "unnamed"})"
  end

  private

  # Get weather from weather generator.
  def weather
    @weather_generator.get
  end

  # Push +aeroplane to hangar.
  def register_arrival(aeroplane)
    @hangar.push(aeroplane)
  end

  # Remove +aeroplane+ from hangar.
  def register_departure(aeroplane)
    @hangar.delete(aeroplane)
  end
end
