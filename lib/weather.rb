class Weather
  attr_reader :weather

  def initialize
    @weather = weather
  end

  def clear?
    wf = rand(1..4)
    case wf
    when 1..3
      @weather = true
    when 4
      @weather = false
    end
    # 1..3 = good weather
    # 4 = stormy weather
    @weather
  end
end
