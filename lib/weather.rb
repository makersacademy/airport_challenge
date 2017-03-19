module Weather

  def stormy?
    @forecast == :stormy
  end

  private

  OUTLOOKS = [:stormy, :sunny, :sunny]

  def forecast
    OUTLOOKS.sample
  end


end
