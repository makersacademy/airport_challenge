class Weather
  def stormy_weather?
    number = rand(1..3)
    if number == 1
      true
    else
      false
    end
  end
end