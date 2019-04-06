require_relative 'weather'
require_relative 'plane'

class Airport

  attr_reader :planes_landed
  attr_reader :planes_taken_off

  def initialize
    @planes_landed = []
    @planes_taken_off = []
  end

  def land(plane)
    @planes_landed.push(plane)
  end

  def take_off(plane)
    @planes_taken_off.push(plane)
  end

end
