#!/usr/bin/env ruby

require './lib/atc'
require './lib/weather'
require './lib/air_exceptions'

class Airport
  attr_reader :name, :hangar, :capacity, :weather_generator
  DEFAULT_CAPACITY = 50

  def initialize(options = {})
    @hangar = []
    @name = options[:name]
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @weather_generator = options[:weather] || Weather.new 
  end

  def occupancy
    @hangar.count
  end

  def full?
    occupancy >= @capacity
  end

  def weather
    @weather_generator.get
  end

  def stormy?
    weather == :stormy
  end

  def include?(aeroplane)
    @hangar.include? aeroplane
  end

  def register_arrival(aeroplane)
    @hangar.push(aeroplane)
  end

  def register_departure(aeroplane)
    @hangar.delete(aeroplane)
  end

  def process_landing(aeroplane)
    ATC.clear(self).to(:land)
    register_arrival(aeroplane)
  end

  def process_docking(aeroplane)
    ATC.clear(self).to(:dock)
    register_arrival(aeroplane)
  end

  def process_take_off(aeroplane)
    ATC.clear(self).to(:take_off)
    register_departure(aeroplane)
  end

  def to_s
    if @name.nil?
      "unnamed airport (#{occupancy}/#{@capacity} aircraft)"
    else
      "'#{@name}' airport (#{occupancy}/#{@capacity} aircraft)"
    end
  end
end
