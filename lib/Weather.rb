module Weather
  def weather
    Random.new.rand(2) == 1 ? "stormy" : "sunny"
  end
end
