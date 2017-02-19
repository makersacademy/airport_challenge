require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  attr_reader :plane
  attr_reader :plane_arr
  # attr_reader :stormy_or_not

  def initialize
    # set_weather
    @plane_arr = []
  end

  def instruct_to_land(plane)
    fail "Landing not permitted due to stormy weather." if stormy?
    @plane = plane
    @plane_arr << @plane
  end

  def take_off(plane)
    @plane = plane
    fail "#{@plane} is not in the airport." unless at_airport?
    fail "Takeoff not permitted due to stormy weather." if stormy?
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
    @plane_arr.include?(plane) ? true : false
  end

end
