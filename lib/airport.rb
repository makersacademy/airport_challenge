class Airport
  attr_accessor :planes, :weather, :capacity

  def initialize(capacity = 10, weather = "sunny")
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    fail "the weather is stormy" if @weather == "stormy"
    fail "the airport is full" if at_capacity?
    @planes << plane
  end

  def take_off(plane)
    fail "plane not in airport" unless present?(plane)
    fail "the weather is stormy" if @weather == "stormy"
    @planes.delete(plane)
  end

  def change_weather(*weather)
    if weather.empty?
      @weather = Weather.new.weather
    else
      @weather = weather[0]
    end
  end

  private

  def present?(plane)
    @planes.include?(plane)
  end

  def at_capacity?
    @planes.length == @capacity
  end
end
