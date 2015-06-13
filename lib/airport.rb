require_relative 'plane'

class Airport

attr_reader :planes

  def initialize
    planes = []
  end

  def land plane
    plane.landing
    planes << plane
  end



end
