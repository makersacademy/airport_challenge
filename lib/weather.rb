module Weather
  def weather
    rand(10) < 8 ? "sunny" : "stormy"
  end
end