class Weather

  def request_weather
    return rand(1..10) <= 8 ? "sunny" : "stormy"
  end

end
