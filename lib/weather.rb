class Weather
  def initialize
    @forecast = forecast
  end

  def forecast
    (1..5).to_a.sample == 1 ? "stormy" : "sunny" # the description of stormy occasionally is ambiguous so this method assumes 20% of the time
  end
end
