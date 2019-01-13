
require_relative "plane.rb"

class Airport
  attr_reader :planes

  # simplifying to just plane taking off and landing
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def depart(plane)
    @planes.pop
  end

  def confirmation?
    @planes.include?(plane) ? false : true
  end
end
