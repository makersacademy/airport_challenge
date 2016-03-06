class Weather

  def stormy?
    sky == :stormy
  end

  private

  SKY = [:stormy, :sunny, :sunny]

  def sky
    SKY.sample
  end

end