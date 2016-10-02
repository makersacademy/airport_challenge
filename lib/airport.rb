class Airport
  attr_accessor :weather
  def change_weather
    @weather = rand(5) < 5 ? 'clear' : 'stormy'
  end
end