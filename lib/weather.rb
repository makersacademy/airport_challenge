class Weather
  def stormy?
    Random.new.rand(5) == 1 ? true : false #Chance of storms is 20%
  end
end