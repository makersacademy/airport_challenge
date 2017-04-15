class Airport

  attr_reader :plane, :runways

  def initialize(capacity = 10)
    @capacity = capacity
    @runways = []
    @capacity.times { @runways << Airplane.new }
  end

  def take_off
    return @runways.pop unless @runways.nil? || Weather.new.check_weather
    "No airplanes landed at the moment."
  end

  def land(plane)
    Weather.new.check_weather
    @plane = plane
    @runways << plane unless landed?(plane) || @runways.count == @capacity
  end

  def landed?(plane)
    return true if @runways.include? plane
    false
  end

end
