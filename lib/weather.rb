class Weather
  def randomiser
    odds = rand(1..10)
    if odds == 8
      "stormy"
    else
      "sunny"
    end
  end
end
