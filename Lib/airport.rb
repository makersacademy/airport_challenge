
require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  attr_reader :planes
  # attr_reader :weather

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
