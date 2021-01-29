class Weather
  attr_reader :report
  def initialize
    weather = rand(2)
    case weather
    when 0 
      @report = "sunny"
    when 1
      @report = "stormy"
    end
  end
end
