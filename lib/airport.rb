require_relative 'plane'

class Airport
  def initialize(capacity = 10)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Dangerous weather!" if bad_weather?

    @planes << plane
  end

  def take_off
    fail "No planes" if empty?
    fail "Dangerous weather!" if bad_weather?

    @planes.pop
    "The plane is in the air"
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def empty?
    @planes.empty?
  end

  def bad_weather?
    weather = ["Sunny", "Sunny", "Sunny", "Stormy"].sample
    weather == "Stormy" ? true : false
  end
end
