class Airport
  attr_accessor :capacity
  attr_reader :weather
  def change_weather
    @weather = rand(5) < 4 ? 'clear' : 'stormy'
  end
end