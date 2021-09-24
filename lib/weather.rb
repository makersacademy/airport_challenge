class Weather
  CONDITIONS = ["Sunny", "Stormy", "Clear", "Raining"]

  def stormy?
    condition == "Stormy"
  end
  
  def condition
    CONDITIONS.sample
  end
end