require_relative 'weather'
require_relative 'plane'

# Understand how to manage planes

class Airport

  include Storm

  DEFAULT_CAPACITY = 10

  attr_reader :name, :planes_in_airport
  attr_accessor :capacity

  def initialize(name = "A#" + "#{self}"[-5..-2])
    @planes_in_airport = []
    @capacity = DEFAULT_CAPACITY
    @name = name.to_sym
  end

  def land(plane)
    landing_criteria(plane)
    plane.landing(@name)
    @planes_in_airport << plane.name
    print "The #{plane.name} landed succesfully"
  end

  def take_off(plane)
    taking_off_criteria(plane)
    @planes_in_airport.delete(plane.name)
    plane.taking_off
    print "The #{plane.name} took off succesfully"
  end

  def landing_criteria(plane)
    fail "#{plane.name} already landed in this airport" if @planes_in_airport.include? plane.name
    fail "#{plane.name} is not in the air" if plane.location != :up_in_the_air
    fail "Can't land as the airport is full" if full?
    fail "Can't land due to stormy weather" if stormy?
  end

  def taking_off_criteria(plane)
    fail "#{plane.name} is not in this aiport" unless @planes_in_airport.include? plane.name
    fail "#{plane.name} is in the air" if plane.location == :up_in_the_air
    fail "Can't take off due to stormy weather" if stormy?
  end

  def weather_forecast
    stormy? ? (print "Stormy") : (print "Clear")
  end

private
  def full?
    @planes_in_airport.count == @capacity
  end

end
