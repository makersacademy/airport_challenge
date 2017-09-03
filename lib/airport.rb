require_relative 'plane'

class Airport

  attr_reader :planes_on_ground, :iata_code

  def initialize(iata_code)
    @planes_on_ground = []
    @iata_code = iata_code
  end

  def land_plane(plane)
    fail 'Operation aborted: Weather is stormy' if stormy?
    @planes_on_ground.push(plane.land(self).tail_number)
  end

  def takeoff_plane(plane, destination)
    fail 'Operation aborted: Weather is stormy' if stormy?
    @planes_on_ground.delete(plane.takeoff(self).tail_number)
  end

  def stormy?
    current_weather = rand(1..7)
    case current_weather
    when 1
      @weather = "sunny"
    when 2
      @weather = "partly cloudy"
    when 3
      @weather = "cloudy"
    when 4
      @weather = "rainy"
    when 5
      @weather = "foggy"
    when 6
      @weather = "windy"
    when 7
      @weather = "stormy"
    end
    @weather == "stormy"
  end

end
