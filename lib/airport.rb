class Airport
  attr_reader :planes

  def initialize
    @planes = []

  end

  def land(plane)
    @planes << plane

  end

  def take_off(*)
    raise "Can not take of if the weather is stormy" if stormy

  end

  def stormy(weather)
    weather
  end
end
