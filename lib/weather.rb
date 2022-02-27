class Weather
  def get_conditions
    rand(1..5) == 5 ? "stormy" : "sunny"
  end
end