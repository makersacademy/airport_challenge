class Plane

  attr_reader :location

  def initialize(location)
    @location = location
    location.planes << self
  end

end
