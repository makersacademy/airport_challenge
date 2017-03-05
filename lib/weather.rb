class Weather

  attr_accessor :stormy

  def initialize
    @stormy = get_weather(rand(1..10))
  end

  def get_weather(number)
    if number > 6
      @stormy = true
    else
      @stormy = false
    end
  end
end
