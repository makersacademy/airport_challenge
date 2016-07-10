module Weather
  FORECAST = ['sunny', 'cloudy', 'rainy', 'storm']

  def self.report
    FORECAST.sample
  end
end
