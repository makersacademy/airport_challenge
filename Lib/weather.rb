class Weather

  attr_accessor :stormy

  def initialize
    @stormy = false
  end

  def current_weather
    if rand(10) > 4
      @stormy = true
    else
      @stormy
    end

  end
end
