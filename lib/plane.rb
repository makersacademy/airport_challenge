class Plane
  attr_reader :location

  def initialize
    @location = "In the air"
  end

  def change_location(location)
    @location = location
  end
end
