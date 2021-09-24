class Weather
  CONDITIONS = ["Sunny", "Stormy", "Clear", "Raining"]
  attr_reader :condition

  def stormy?
    condition == "Stormy"
  end
  
  def condition
    CONDITIONS.sample
  end
end