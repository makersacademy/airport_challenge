class Weather
  attr_reader :weather

  def initialize
    @weather = weather
  end

  def forecast
    wf = rand(1..2)
    case wf
    when 1
      weather = true
    when 2
      weather = false
    end
    # 1 = good weather - true means plane can take off
    # 2 = stormy weather - false means plane cannot take off
    weather
  end
end
