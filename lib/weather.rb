class Weather

  WEATHER_POSSIBLES = ["sunny", "sunny", "stormy"]  
  # more sunnys  than stormys so that only occasionally the status is stormy

  attr_reader :status

  def initialize(status = WEATHER_POSSIBLES.sample)
    @status = status
  end

  
end
