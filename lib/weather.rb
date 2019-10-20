class Weather

  def forecast
    forecast = rand(1..5)
    forecast == 5 ? "stormy" : "sunny"
  end

end
