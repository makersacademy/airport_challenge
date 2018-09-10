class Airport
  attr_reader :planes

  def initialize(weather)
    @weather = weather
    @planes = []
  end

  def stormy?
  	@weather.is_stormy?
  end
end
