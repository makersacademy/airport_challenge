class Weather
  def conditions
    ["stormy", "sunny", "sunny", "sunny"][rand(0..3)]
  end

  def stormy?
    conditions == "stormy"
  end
end
