class Weather

  def conditions
    [:stormy, :sunny, :sunny, :sunny]
  end

  def selector
    conditions.sample
  end

  def stormy?
    return true if selector == :stormy
    false
  end

end
