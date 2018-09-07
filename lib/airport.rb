class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    fail 'No landing, weather is stormy!' if stormy?
    @hangar << plane
  end

  def take_off(plane)
    fail 'No take off, weather is stormy!' if stormy?
    @hangar.delete(plane)
  end

  def plane_in_hangar?(plane)
    @hangar.include?(plane)
  end

  def stormy?
    weather = [true, false, false, false, false]
    weather.sample
  end
end
