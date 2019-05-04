class Weather
  def random_num
    rand(100)
  end

  def weather
    if random_num >= 85
      "stormy"
    else
      "fair"
    end
  end
end
