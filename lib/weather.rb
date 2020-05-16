class Weather

  def weather_check
    if rand(6) < 5
      "Clear"
    else
      "Stormy"
    end
  end

end
