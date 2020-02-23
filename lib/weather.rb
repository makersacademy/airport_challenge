class Weather

  def stormy?
    conditions = ["clear", "clear", "clear", "stormy"]
    condition = conditions.sample
    condition == 'stormy'
  end

end
