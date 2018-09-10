class Airport
  attr_reader :planes

  def initialize(weather)
    @weather = weather
    @planes = []
  end

  def stormy?
  end

end
