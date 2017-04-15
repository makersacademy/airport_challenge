class Airport

  attr_reader :plane, :runways

  def take_off
    return @runways.pop unless @runways.nil? || Weather.new.check_weather
    "No airplanes landed at the moment."
  end

  def land(plane)
    Weather.new.check_weather
    @plane = plane
    @runways = []
    @runways << plane unless landed?(plane)
  end

  def landed?(plane)
    return true if @runways.include? plane
    false
  end

end
