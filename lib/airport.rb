require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    if weather_unsafe?
      raise "The weather is too dangerous to land"
    elsif full?
      raise "Airport full"
    elsif @planes.include?(plane)
      raise "This plane is already in the airport"
    else
      @planes << plane
    end
  end

  def take_off(plane)
    if weather_unsafe?
      raise "The weather is too dangerous to take off"
    elsif !@planes.include?(plane)
      raise "This plane is not in the airport"
    else
      @planes.delete(plane)
      @planes
    end
  end

  def weather_unsafe?
    @weather.stormy?
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
