class Plane

  attr_reader :location

  def initialize(location = :landed)
    @location = location
  end

  def land
    location = :landed
  end

end
