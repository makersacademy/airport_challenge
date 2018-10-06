class Airport
  attr_reader :weather
  def initialize
    @weather = Weather.new
  end

  def check_weather
    @weather.check
  end

  def land(plane)
    @hanger = plane
  end

  def take_off(plane)
    @hanger = ""
    plane
  end

  def in_hanger?(plane)
    @hanger == plane
  end
end
