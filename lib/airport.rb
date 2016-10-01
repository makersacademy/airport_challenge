require './lib/plane.rb'

class Airport

  attr_reader :plane

  def initialize
    @plane = []
  end

  def take_off(plane)
    @plane =- 1
  end

  def landing(plane)
    @plane << plane
  end

end
