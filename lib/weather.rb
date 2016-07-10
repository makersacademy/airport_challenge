module Weather
FORECAST = ['sunny', 'cloudy', 'rainy', 'storm']

  def self.report(conditions = FORECAST)
    conditions.sample
  end
end
