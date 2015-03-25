module Weather
  def weather
    rand(0..3) == 3 ? "stormy" : "sunny"
  end
end
