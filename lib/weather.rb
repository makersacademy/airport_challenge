class Weather
  STATES = [ :sunny ,:sunny, :stormy]
  attr_reader :state

  def initialize
    @state = STATES.sample
  end
end
  # attr_reader :weather
  #
  # def weather_rand
  #   rand(3)
  # end
  #
  # def set_weather
  #   states = [ "sunny" ,"sunny", "stormy"]
  #   if states[weather_rand] == "sunny"
  #     @weather = false
  #   else
  #     @weather = true
  #   end
  # end
  #
  # def stormy?
  #   @weather == true
  # end
