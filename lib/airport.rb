require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
      @planes = []
  end

  def land(plane)
      @planes << plane
  end

  def depart
      if stormy?
        fail("You cannot take-off, it is too stormy")
      else
        @planes.pop
      end
  end

  def stormy?
      @stormy
  end

end
