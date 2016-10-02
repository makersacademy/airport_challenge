class Airport
  attr_accessor :weather
  def change_weather
    @weather = rand(5) < 4 ? 'clear' : 'stormy'
  end
end