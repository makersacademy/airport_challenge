class Weather
  attr_reader :weather
  def initialize
    @weather = rand(1..10)
    if @weather.between?(1, 8)
      @weather = 'sunny'
    else
      @weather = 'stormy'
    end
  end
end
