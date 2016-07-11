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

    if weather.stormy?
      raise 'The weather is stormy. Your flight will have to be rescheduled.'
    else
      @airplanes.pop
      "#{airplane} has successfully taken off."
    end
  end

  def accept_landing(airplane)
    if weather.stormy? 
      raise 'The weather is stormy. Your flight will have to be rerouted.'
    elsif
      @airplanes.length == capacity
      raise 'The airport is full'
    else
      @airplanes << airplane
    "#{airplane} has successfully landed."
    end
  end
end
