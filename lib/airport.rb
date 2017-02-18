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

  def confirm_landed
    fail "No plane has landed" if empty?
    "#{@plane} has landed"
  end

  private
  def empty?
    @plane_arr.empty? ? true : false
  end

end
