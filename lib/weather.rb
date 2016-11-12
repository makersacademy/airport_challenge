class Weather

  def sunny_or_stormy
    sunny_or_stormy = [:stormy, :sunny, :sunny, :sunny]
  end

  def stormy?
  sunny_or_stormy.sample == :stormy
  end

  def sunny?
  sunny_or_stormy.sample == :sunny
  end

end
