class Weather
  def stormy?
    if rand(1..10) > 5
      plane.landed? ? "Stormy, cannot take off" : "Stormy, cannot land here"
    end
  end
end
