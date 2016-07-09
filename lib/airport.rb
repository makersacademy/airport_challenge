require_relative 'plane'

class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end
def land plane
@planes << plane
"The plane #{plane} has landed"
end
def take_off plane
  "The plane #{planes.delete plane} has taken off"
end
end
