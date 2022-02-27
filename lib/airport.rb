require 'plane'

class Airport
  attr_reader :aerodrome

  def initialize
    @aerodrome = []
  end
  
  def receive_plane(plane)
    @aerodrome << plane
  end
end
