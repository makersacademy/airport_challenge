module Weather

  def current_weather(determiner = rand)
    determiner > 0.8 ? "bad" : "good"
  end

end
