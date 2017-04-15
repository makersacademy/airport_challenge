require_relative './plane.rb'
require_relative './weather.rb'

class Airport
  include Weather
  attr_accessor :slots, :weather, :slot_limit

  def initialize(limit = 30)
    @slots = []
    @weather = weather
    @slot_limit = limit
  end

  def land(plane)
    fail "Weather conditions too dangerous for landing" if @weather == "stormy"
    if full? then fail "All airport landing slots currently occupied" else @slots.push(plane) end
  end

  def takeoff(slot_number)
    fail "Weather conditions too dangerous for take-off" if @weather == "stormy"
    @slots.delete_at(slot_number)
  end

  def full?
    true if @slots.count >= @slot_limit
  end

end
