module Weather

  ELEMENTS = [:sunny, :stormy, :sunny, :sunny, :sunny, :stormy, :sunny]

  def forecast
    ELEMENTS.sample
  end

  def stormy?
    false
  end

end
