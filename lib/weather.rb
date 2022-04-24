class Weather
  attr_reader :stormy

  def conditions
    ["stormy", "sunny", "sunny", "sunny"].sample
  end 
  
  def stormy?
    conditions == "stormy"
  end
end
