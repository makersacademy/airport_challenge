require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end



  def land(plane)
    plane.land
    @planes << plane
  end





















end