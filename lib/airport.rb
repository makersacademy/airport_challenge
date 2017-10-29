class Airport
  attr_accessor :planes, :weather

  def initialize(weather = "sunny")
    @planes = []
    @weather = weather
  end

  def land(plane)
    fail "plane already in airport" if present?(plane)
    fail "the weather is stormy" if @weather == "stormy"
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

end
