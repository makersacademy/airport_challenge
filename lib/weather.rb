class Weather

  def stormy?
    randomize == :stormy
  end
  
  private

  OUTLOOKS = [:stormy, :sunny, :sunny, :sunny, :sunny]
  
  def randomize
    OUTLOOKS.sample
  end

end
