require_relative 'plane.rb'

class Airport
  attr_reader = :planes

  def initialize
    @planes = []
  end

  def take_off
  end

  def land(plane)
    @planes << plane
  end
end
