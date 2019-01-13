class Weather
  attr_reader :weather_types

  def initialize
    @weather_types = ['sunny', 'stormy']
  end

  def now
    @weather_types.sample
  end
end
