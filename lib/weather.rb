class Weather

  def conditions
    states = ["stormy", "sunny"]
    states.sample
  end

  def stormy?
    conditions == 'stormy'
  end

end
