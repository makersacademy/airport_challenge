class Airport
  attr_accessor :plane
  attr_accessor :weather

  def initialize(weather = Weather.new)
    @planes = []
    @weather = weather
  end

  def land(airport)
    raise 'Bad weather, landing denied' if stormy?
    @planes << airport
  end

  def take_off(plane)
    raise 'No planes present' if empty?
    raise 'Bad weather, take-off denied' if stormy?
    @planes.delete(plane) && "#{plane} has taken off"
  end

  # private

  def empty?
    @planes.size.zero?
  end

  attr_reader :weather

  def stormy?
    @weather == "stormy"
  end
end

class Weather
    [:stormy, :fine, :fine, :fine].sample
end

class Plane
end
