class Weather

  attr_reader :weather_state, :storm_index

  def initialize(storm_index = Random.rand(100))
    @weather_state = :fair
    @storm_index = storm_index
  end

  def stormy?
    check_weather_state == :stormy
  end

  private
  def check_weather_state
    @weather_state = :stormy if @storm_index > 75
    @weather_state
  end

end
