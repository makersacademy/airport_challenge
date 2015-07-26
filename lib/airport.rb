require_relative 'plane.rb'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def call_landing(plane)
    plane.land
    @planes << plane
    plane
  end

  def call_takeoff
    plane = planes.pop
    plane.takeoff
    plane
  end

end
