require_relative 'plane'

class Airport

  attr_reader :plane
  attr_reader :plane_arr

  def initialize
    @plane_arr = []
  end

  def instruct_to_land(plane)
    @plane = plane
    @plane_arr << @plane
  end

  def take_off(plane)
    @plane = plane
    fail "#{@plane} is not in the airport." unless at_airport?
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
