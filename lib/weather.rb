class Weather
  attr_reader :weather

  def current_conditions

    weather_type = ["stormy", "sunny", "sunny", "sunny", "stormy"]
    @conditions << weather_type.sample
    #i = rand(1..10)
    #if i < 8
  	#  return "sunny"
    #else
  	#  return "stormy"
    #end
    @conditions

  end

end