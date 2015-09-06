module Weather
  def stormy?
    weather = rand(10)
    weather <= 2 ? true : false
  end
end
