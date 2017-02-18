require_relative 'plane'

class Airport

  attr_reader :plane
  attr_reader :plane_arr

  def initialize
    @plane_arr = []
  end

  def instruct_to_land(plane)
    @plane_arr << plane
    @plane = plane
  end

  def take_off(plane)
    @plane = plane
    @plane_arr.delete_if { |y| y == plane }
    "#{@plane} has taken off."
  end

  def confirm_takeoff(plane)
    @plane = plane
    fail "#{plane} is not in airport" if @plane_arr.include?(@plane)
    "#{@plane} has taken off."
  end

  def confirm_landed(plane)
    @plane = plane
    fail "There are no planes at the airport." if empty?
    fail "#{@plane} not in airport." unless landed?
    "#{@plane} has landed."
  end

  private
  def empty?
    @plane_arr.empty? ? true : false
  end

  def landed?
    @plane_arr.include?(@plane) ? true : false
  end

end
