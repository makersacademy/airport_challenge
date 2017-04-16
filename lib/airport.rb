# requires files containing our Plane class and Weather module
require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  # includes weather module from our weather.rb file, so the weather_today method can be called
  include Weather
  # lets us read/change these variables from outside the class
  attr_accessor :slots, :weather, :slot_limit

  # New airports start with empty @slots array, and @weather set randomly by weather_today.
  # Capacity (@slot_limit) set by default to 30, or user can specify when initializing
  def initialize(limit = 30)
    @slots, @weather, @slot_limit = [], weather_today, limit
  end

  # 'Lands' planes by pushing them to the array. Fails if at capacity, or if weather is stormy.
  def land(plane)
    fail "Weather conditions too dangerous for landing" if @weather == "stormy"
    fail "All airport landing slots currently occupied" if full?
    @slots.push(plane)
  end

  # Makes planes 'take off' by deleting them from the array. Fails if weather is stormy.
  def takeoff(slot_number)
    fail "Weather conditions too dangerous for take-off" if @weather == "stormy"
    @slots.delete_at(slot_number)
  end

  # Returns true if number of array elements meets or exceeds the capacity specified in @slot_limit
  def full?
    true if @slots.count >= @slot_limit
  end

end
