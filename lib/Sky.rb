class Sky
  def check_weather
    random_number = rand(10)
    if random_number == 1
      "stormy"
    else
      "sunny"
    end
  end
end
