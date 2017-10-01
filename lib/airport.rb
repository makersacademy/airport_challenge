require_relative "plane"

class Airport

  def initialize(capacity = 10)
  @capacity = capacity
  @planes = []
  end

  attr_reader :planes

  def takeoff(plane)
    fail "The airport is empty" if empty?
  @planes.delete(plane)
  end

  def land(plane)
    check = weather_check
    fail "The weather is stormy" if check == "storms"
    fail "Airport full" if full?
  @planes << plane
  end

  def confirm_if_plane_in_airport(plane)
  "#{plane} is in the airport" if @planes.include? plane
  "#{plane} is not in the airport"
  end

  def weather_check
  weather = 1 + rand(100)
  weather > 95 ? "storms" : "sunny"
  end

  private

  def full?
  @planes.count >= @capacity
  end

  def empty?
  @planes.empty?
  end

end
