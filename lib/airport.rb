require_relative 'plane.rb'

class Airport

  def initialize
    @planes = Array.new
  end

# airport class method to land planes
def land(plane)
  @planes << plane
end

def planes
  @planes
end

end
