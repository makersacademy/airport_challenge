require './lib/plane.rb'

class Airport

  attr_reader :plane

  def initialize
    @plane = 0
  end

  def take_off
  end

  def landing(plane)
    @plane =+ 1
  end

end
