class Weather
  attr_reader :current_conditions


  def current_conditions
    @condition = ""
    weather_type = ["stormy", "sunny", "sunny", "sunny", "stormy"]
    @condition = weather_type.sample
    #i = rand(1..10)
    #if i < 8
  	#  return "sunny"
    #else
  	#  return "stormy"
    #end
    @condition

  end

end