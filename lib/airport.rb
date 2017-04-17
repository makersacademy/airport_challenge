require_relative 'plane'

class Airport
  attr_accessor :plane

  def initialize
    @plane = []
  end

  def parked(plane)
    if plane.true?
      @plane << plane
    end

  end

end
