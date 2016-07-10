require_relative 'weather'

class Airport

  attr_reader :weather

  def initialize(weather = Weather.new)
    @airplanes = []
    @weather = weather
  end

  def get_airplanes
    @airplanes
  end

  def accept_takeoff(airplane)

    if weather.stormy? == true
      raise 'The weather is stormy. Your flight will have to be rescheduled.'
    else
      @airplanes.pop
      "#{airplane} has successfully taken off."
    end
  end

  def accept_landing(airplane)
    if weather.stormy? == true
      raise 'The weather is stormy. Your flight will have to be rerouted.'
    else
      @airplanes << airplane
    "#{airplane} has successfully landed."
    end
  end
end
