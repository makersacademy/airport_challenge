class Weather
  attr_reader :weather

  def initialize
    @weather = weather
  end

  def clear?
    case rand(1..4)
    when 1..3
      weather = true
    when 4
      weather = false
    end
    # 1..3 = good weather
    # 4 = stormy weather
    weather
  end
end
