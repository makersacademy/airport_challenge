class Weather

  def stormy?
    forecast == "stormy"
  end 

  def forecast
    (1..5).to_a.sample == 1 ? "stormy" : "sunny"
  end

end
