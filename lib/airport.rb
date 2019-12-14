require_relative 'plane'

class Airport

attr_accessor :landing_area

  def initialize
    @landing_area = []
  end

  def land(plane)
    @landing_area << plane
  end

end