class Plane

  attr_reader :location

  def initialize
    @location = "air"
  end

  def land_at(airport)
    @location = airport if correct_location?
  end

  def takeoff_from(airport)
    @location = "air" if correct_location?(airport)
  end

  private
  def correct_location?(location = "air")
    @location == location
  end

end
