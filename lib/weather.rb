class Weather
  # attr_accessor :weather_forecast

  def generates
    types = [:sunny, :sunny, :stormy, :sunny, :sunny]
    types[rand(0..4)]
  end
end