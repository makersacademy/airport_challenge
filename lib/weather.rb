class Weather
  def stormy?
    rand(5) == 1
  end
end

=begin

#Jade's alternative solution:

class Weather

  def stormy?
    forecast == :stormy
  end

  FORECASTS = [:stormy, :sunny, :sunny, :sunny]

  def current_forecast
    FORECASTS.sample
  end

=end