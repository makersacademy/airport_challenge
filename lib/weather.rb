class Weather
  def stormy?
   Random.rand(1..4) == 1 ? true : false
  end
end
