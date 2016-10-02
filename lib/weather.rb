module Weather

  def stormy?
    forecast == :stormy
  end

private

ELEMENTS = [:sunny, :stormy, :sunny, :sunny, :sunny, :sunny]

  def forecast
    ELEMENTS.sample
  end

end
