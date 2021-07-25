class Weather
	
	# A scaleable weather class allowing for weighted weather choosing
	# Add desired weather to the WEATHER hash
	
  WEATHER = {
    "sunny" => 9,
    "stormy" => 1
  }
	
  attr_reader :weather

  def initialize
    @weather = weather_setter
  end

  def weather_setter
    weight = rand(WEATHER.values.sum)
    WEATHER.keys.each do |key|
      weight -= WEATHER[key]
      if weight <= 0
        return key
      end
    end
  end
end
