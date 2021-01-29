class Weather
  def report
    weather = rand(2)
    case weather
    when 0 
      "sunny"
    when 1
      "stormy"
    end
  end
end
