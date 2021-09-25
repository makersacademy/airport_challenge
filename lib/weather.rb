class Weather
  attr_reader :weather

  def initialize
    @weather
  end

  def forecast
    wf = rand(1..2)
    case wf
    when 1
      @weather = "clear skies"
    when 2
      @weather = "stormy"
    end
    # 1 = good weather
    # 2 = stormy weather 
  end
end
