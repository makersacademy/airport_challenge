module Weather
  def stormy?
    i = rand(0..10)
    i > 7 ? true : false
  end
end
