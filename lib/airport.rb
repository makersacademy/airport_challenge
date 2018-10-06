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
end
