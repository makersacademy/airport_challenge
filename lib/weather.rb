class Weather
  def new_day
    today = rand(4)
    if today == 1
      "Stormy"
    else
      "Sunny"
    end
  end
end
