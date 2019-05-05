class Plane
  attr_accessor :location

  def initialize
    @location = 'sky'
  end

  def land(weather, airport)
    land_guards(weather, airport)
    airport.land_plane
    self.location = airport
  end

  def land_guards(weather, airport)
    raise "can\'t land in bad weather" if weather.condition == 'bad'
    raise 'can\'t land if you already did' unless self.location == 'sky'
    raise "can't land in a full airport" if airport.check_capacity == 'full'
  end

  def takeoff(weather, airport)
    takeoff_guards(weather, airport)
    location.takeoff_plane
    self.location = 'sky'
  end

  def takeoff_guards(weather, airport)
    raise "can\'t takeoff in bad weather" if weather.condition == 'bad'
    raise "can\'t takeoff if already flying" if self.location == 'sky'
    raise "can only takeoff from current airport" if self.location != airport
  end
end
