class Weather
  def forecast
    wf = rand(1..2)
    case wf
    when 1
      "clear skies"
    when 2
      "stormy"
    end
    # 1 = good weather
    # 2 = stormy weather 
  end
end
