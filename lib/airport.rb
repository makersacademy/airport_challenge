class Airport
  WEATHER_STATE = ["sunny", "mild", "cloudy", "misty", "rainy", "stormy"]

  attr_reader :capacity, :landed_airplanes

  def initialize(capacity = 500)
    @capacity = capacity
    @landed_airplanes = []
  end

  def request_to_land(plane)
    unless prevent_landing
      @landed_airplanes << plane 
      return true
    end
    false
  end

  def request_to_take_off(plane)
    unless prevent_take_off
      @landed_airplanes.delete(plane)
      return true
    end
    false
  end

  def stormy?
    report_weather == "stormy"
  end

  def report_weather
    WEATHER_STATE.sample
  end

  def prevent_take_off
    stormy? 
  end

  def prevent_landing
    stormy? || full?
  end

  private
  def full?
    landed_airplanes.count == capacity 
  end
end
