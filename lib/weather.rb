
module Weather

  private

  def stormy?
    today == :stormy
  end

  def today
    rand < 0.8 ? climates[0] : climates[1]
  end

  def climates
    [:sunny,:stormy]
  end
end
