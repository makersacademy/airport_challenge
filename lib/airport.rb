require_relative 'plane'
class Airport
  def initialize
    @planes = []
  end

attr_reader :planes

def land(plane)
  plane.landed
  @planes << plane
end





end
