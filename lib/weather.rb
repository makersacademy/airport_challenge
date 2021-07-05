class Weather
  def stormy?
    rand(5) == 1
  end
end

=begin

#Jade's alternative solution:

class Weather

FORECASTS = [:stormy, :sunny, :sunny, :sunny]

  def forecast
    FORECASTS.sample
  end

   def stormy?
    forecast == :stormy
  end
end

=end
