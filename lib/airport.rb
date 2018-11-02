class Airport

  attr_reader :planes_in_airport
  attr_reader :weather

  def initialize
    @planes_in_airport = []
    @weather = Weather.new
  end

  def plane_is_added_to_available_fleet(plane)
    @planes_in_airport << plane
  end

  def plane_in_airport?(plane)
    @planes_in_airport.include?(plane)
  end

  def plane_is_removed_from_available_fleet(plane)
    @planes_in_airport -= [plane]
  end
  def check_weather_and_if_OK_take_off?
    if @weather.weather != "raining" then true
    else
      false
    end
  end
end
