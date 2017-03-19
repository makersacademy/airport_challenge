class Weather
  #describes the weather only
  def stormy_weather?
    random_number = rand(10)
    if random_number >= 8
      true
    else
      false
    end
  end
end
