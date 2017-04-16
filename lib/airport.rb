class Airport

  attr_reader :plane, :runways, :weather, :capacity

  def initialize(capacity = 10)
    @capacity = capacity
    @weather = Weather.new
    @runways = []
    @capacity.times { @runways << Airplane.new }
  end

  def take_off(plane)
    @runways.delete(plane) unless @weather.stormy? || empty
  end

  def land(plane)
    @runways << plane unless landed?(plane) || full || @weather.stormy?
  end

  def landed?(plane)
    return true if @runways.include? plane
    false
  end

  def full
    return raise "Airport is full." if @runways.count == @capacity
  end

  def empty
    return raise "Airport is empty." if @runways.empty?
  end

end
