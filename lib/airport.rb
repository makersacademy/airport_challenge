class Airport

  def initialize(capacity=10)
    @plane = nil
    @weather = Weather.new.current_weather
  end

  attr_accessor :plane

  def full?
    self.plane != nil
  end

  def land(plane)
    self.plane= plane
  end

  def has_plane?(plane)
    self.plane==plane
  end

  def takeoff(plane)
    self.plane= nil
  end
end
