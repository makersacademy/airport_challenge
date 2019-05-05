class Plane
  attr_accessor :location

  def initialize
    @location = 'sky'
  end

  def land(_weather, airport)
    # raise 'can\'t land' unless self.location == 'sky'
    airport.land_plane
    self.location = airport
  end

  def takeoff(weather, airport)
    raise "can\'t takeoff in bad weather" if weather.condition == 'bad'
    raise "can\'t takeoff if already flying" if self.location == 'sky'
    raise "can only takeoff from current airport" if self.location != airport
    location.takeoff_plane
    self.location = 'sky'
  end
end
