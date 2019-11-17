module Weather
  def weather(probability)
    if rand(100) < probability
      @weather = "stormy"
    else
      @weather = "normal conditions"
  end
end
