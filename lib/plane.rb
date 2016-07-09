class Plane

  attr_reader :location

  def initialize(location = :landed)
    @location = location
  end

  def land
    @location = :landed
  end

  def take_off
    @location = nil
  end

end
