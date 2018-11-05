class Weather

  def initialize
    @stormy = stormy?
  end

  def stormy?
    weather_types = ["sunny", "stormy"]
    return true if weather_types.sample == "stormy"
    return false
  end
end
