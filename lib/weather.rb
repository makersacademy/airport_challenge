class Weather

  def initialize
    @weather_array = []
    5.times {@weather_array.push("sun")}
    2.times {@weather_array.push("storm")}
  end

  def stormy?
    if @weather_array.sample == "storm"
      return true
    else
      return false
    end
  end

  
end
