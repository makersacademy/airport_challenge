class Weather
  WEATHER_PATTERNS = ["stormy", "sunny", "sunny",
     "sunny", "sunny", "sunny", "sunny"
   ]
  attr_reader :weather
  def initialize
    @weather = WEATHER_PATTERNS.sample
  end

  # def stormy?
  #   weather_patterns = ["stormy", "sunny", "sunny",
  #      "sunny", "sunny", "sunny", "sunny"
  #    ]
  #   weather_patterns.sample
  # end
end
