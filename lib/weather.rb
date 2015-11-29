class Weather
  def current
    return "stormy" if rand(10) > 8
    "sunny"
  end
end