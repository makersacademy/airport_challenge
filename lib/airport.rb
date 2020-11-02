require '~/Projects/airport_challenge/lib/weather.rb'

class Airport

  $DEFAULT_CAPACITY = 35

  attr_reader :landed_planes, :capacity, :airport_weather

  def initialize(capacity = $DEFAULT_CAPACITY)
    @landed_planes = []
    @capacity = capacity
    @airport_weather = Weather.new
  end

  def inbound_flight(plane)
    raise Exception.new "Landing denied due to stormy weather." if @airport_weather.request_weather == "stormy"
    raise Exception.new "Landing denied - Airport in full capacity" if full?
    @landed_planes << plane if !@landed_planes.include?(plane)
  end

  def outbound_flight(plane)
    raise Exception.new "Take off denied due to stormy weather." if @airport_weather.request_weather == "stormy"
    # raise Exception.new "Take off denied as plane is not at the airport"
    @landed_planes.delete(plane) if at_airport?
  end

  private

  def full?
    @landed_planes.length == @capacity
  end

  def at_airport?
    !@landed_planes.include?(self)
  end

end
