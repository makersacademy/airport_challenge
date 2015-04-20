class Airport

  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def land plane
    check_weather_for(__method__)
    fail "Airport full, can't land." if full?
    plane.land!
    planes << plane
  end

  def take_off plane
    check_weather_for(__method__)
    plane.take_off
    planes.delete plane
  end

  def full?
    planes.count == capacity
  end

  def check_weather_for transit
    fail "Cant #{transit} in storm" if weather == 'Stormy'
  end

  def weather
    rand(10) > 3 ? "Sunny" : "Stormy"
  end

end
