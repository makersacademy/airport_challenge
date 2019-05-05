class Plane
  attr_accessor :location

  def initialize
    @location = 'sky'
  end

  def land(airport)
    #raise 'can\'t land' unless self.location == 'sky'
    airport.land_plane
    self.location = airport
  end

  def takeoff
    location.takeoff_plane
    self.location = 'sky'
  end
end
