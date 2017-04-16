class Airport

  attr_reader :plane, :runways

  def initialize(capacity = 10)
    @capacity = capacity
    @plane = plane
    @weather = Weather.new
    @runways = []
    @capacity.times { @runways << Airplane.new }
  end

  def take_off(plane)
    return @runways.delete(plane) unless @runways.nil? || @weather.stormy?
    "No airplanes landed at the moment."
  end

  def land(plane)
    @weather.stormy?
    @runways << plane unless landed?(plane) || @runways.count == @capacity
  end

  def landed?(plane)
    return true if @runways.include? plane
    false
  end

end
