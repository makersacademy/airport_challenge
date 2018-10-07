class Plane
  attr_accessor :location
  AIRBORN = :airborn
  DEFAULT_LOCATION = AIRBORN
  def initialize(location = DEFAULT_LOCATION)
    @location = location
  end

end
