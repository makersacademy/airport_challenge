class Weather
  def random_integer
    rand(100)
  end

  def current
    random_integer > 95 ? "stormy" : "sunny"
  end
end
