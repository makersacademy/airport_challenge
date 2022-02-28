class Weather

  def conditions
    conditions = ["stormy", "rainy", "sunny", "cloudy"]
    conditions.sample
  end 

  def stormy?
    true if conditions == "stormy"
  end
end
