class Airport
  attr_reader :planes, :weather
  def initialize(weather: Weather.new)
    @weather = weather
    @planes = []
  end
end
