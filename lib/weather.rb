class Weather

  def stormy?
    sky == :stormy
  end

  private

  SKY = [:stormy, :sunny, :sunny].freeze

  def sky
    SKY.sample
  end

end