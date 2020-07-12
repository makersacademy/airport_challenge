class Weather

  attr_reader :forecast

  def initialize
    @forecast = (1..5).to_a.sample == 1 ? "stormy" : "sunny"
  end

  def forecast
    @forecast # the description of stormy occasionally is ambiguous so this method assumes 20% of the time
  end
end
