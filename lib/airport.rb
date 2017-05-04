require_relative 'weather'

class Airport

  attr_reader :weather
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @airplanes = []
    @weather = weather
    @capacity = capacity
  end

  def get_airplanes
    @airplanes
  end

  def accept_takeoff(airplane)

      raise 'The weather is stormy. Your flight will have to be rescheduled.' if weather.stormy?

      @airplanes.pop
      "#{airplane} has successfully taken off."
  end

  def accept_landing(airplane)
    raise 'The weather is stormy. Your flight will have to be rerouted.' if weather.stormy?
    raise 'The airport is full' if @airplanes.length == capacity

    @airplanes << airplane
    "#{airplane} has successfully landed."

  end
end
