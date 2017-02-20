module Weather
  def stormy?
    weather = rand(0..10)
    weather > 7 ? true : false
  end
end
