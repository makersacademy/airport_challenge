class Airport
  attr_reader :planes, :capacity

  def initialize
    @planes = []
    @capacity = 20
  end

  def land plane
    check_weather_for(__method__)
    fail 'Airport is full, cannot land.' if full?
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
    fail "You cannot #{transit} in a storm." if weather == 'Stormy'
  end

  def weather
  end

end
