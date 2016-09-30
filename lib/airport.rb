require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def confirm_land(plane)
    planes << plane
  end
end
