require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10

  attr_reader :plane_arr
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane_arr = []
  end

  def instruct_to_land(plane)
    @plane = plane
    fail "Landing not permitted as max capacity has been reached." if at_capacity?
    fail "#{@plane} is in the airport." if at_airport?
    fail "Landing not permitted due to stormy weather." if stormy?
    @plane_arr << @plane
    self
  end

  def take_off(plane)
    @plane = plane
    fail "#{@plane} is not in the airport." unless at_airport?
    fail "Take off not permitted due to stormy weather." if stormy?
    @plane_arr.delete_if { |p| p == @plane }
  end

  def confirm_takeoff(plane)
    @plane = plane
    fail "#{@plane} is still in the airport." if at_airport?
    "#{@plane} has taken off."
  end

  def confirm_landed(plane)
    @plane = plane
    fail "#{@plane} is not in the airport." unless at_airport?
    "#{@plane} has landed."
  end

  private
  def at_airport?
    @plane_arr.include?(@plane)
  end

  def at_capacity?
    @plane_arr.length == @capacity
  end

end
